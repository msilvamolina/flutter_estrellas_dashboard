import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:estrellas_dashboard/app/data/models/variant_info/variant_info.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../data/providers/repositories/products/products_repository.dart';
import '../../../utils/utils_image.dart';
import '../dialogs/add_attribute_dialog.dart';
import '../dialogs/add_variation_dialog.dart';
import '../dialogs/select_attributes_dialog.dart';

class NewVariationsCustomPickersController extends GetxController {
  MainController _mainController = Get.find<MainController>();
  ProductsRepository _repository = ProductsRepository();

  final RxList<VariantAttributeModel> _list = <VariantAttributeModel>[].obs;
  List<VariantAttributeModel> get list => _list.toList();

  final RxList<VariantVariantModel> _listVariations =
      <VariantVariantModel>[].obs;
  List<VariantVariantModel> get listVariations => _listVariations.toList();
  RxList<VariantAttributeModel> listAttributes = RxList();
  late ProductFirebaseModel product;

  RxBool isButtonEnabled = false.obs;
  RxBool showButton = false.obs;
  Map<String, bool> variantChecked = {};

  VariantInfoModel? variantInfoModel;
  RxBool isLoading = true.obs;

  late List<ProductVariantModel>? listCombination;

  @override
  Future<void> onInit() async {
    product = Get.arguments[0] as ProductFirebaseModel;
    listCombination = Get.arguments[1] as List<ProductVariantModel>;

    _list.bindStream(_repository.getAttributes());
    _listVariations.bindStream(_repository.getVariant());
    variantInfoModel = await _repository.getVariantsInfo(product.id);

    if (variantInfoModel != null) {
      buildVariantsInfo();
    }
    isLoading.value = false;

    super.onInit();
  }

  void buildVariantsInfo() {
    if (variantInfoModel == null) return;

    listAttributes.clear();
    variantChecked.clear();

    if (variantInfoModel!.attributes != null) {
      listAttributes.addAll(variantInfoModel!.attributes!);
    }

    if (variantInfoModel!.variants != null) {
      for (var variant in variantInfoModel!.variants!) {
        variantChecked[variant.id] = true;
      }
    }

    isButtonEnabled.value = isVariantCheckedEmpty();
    showButton.value = listAttributes.isNotEmpty;

    update(['view']);
  }

  List<VariantVariantModel> getVariations(VariantAttributeModel attribute) {
    return listVariations
        .where((variant) => variant.attributeId == attribute.id)
        .toList();
  }

  void onVariantPressed(VariantVariantModel variant) {
    bool isChecked = variantChecked[variant.id] ?? false;
    variantChecked[variant.id] = !isChecked;

    isButtonEnabled.value = isVariantCheckedEmpty();
    update(['view']);
  }

  bool isVariantCheckedEmpty() {
    if (variantChecked.isNotEmpty) {
      return true;
    } else {
      return variantChecked.values.any((value) => value);
    }
  }

  bool isVariantChecked(VariantVariantModel variant) {
    return variantChecked[variant.id] ?? false;
  }

  Future<void> selectAttributes() async {
    bool isListAttributesEmpty = listAttributes.isEmpty;

    List<String>? newList = await moreOptionsWithCheckboxes(
      list: list,
      listAttributes: listAttributes,
      onSave: saveAttribute,
    );

    if (newList != null) {
      listAttributes.clear();

      for (String element in newList) {
        VariantAttributeModel? matchingAttribute =
            list.firstWhereOrNull((attribute) => attribute.name == element);
        if (matchingAttribute != null) {
          listAttributes.add(matchingAttribute);
        }
      }
      showButton.value = listAttributes.isNotEmpty;

      if (isListAttributesEmpty) {
        openGuideTour();
      }
    }
  }

  Future<void> saveAttribute() async {
    String? name = await addAttribute();

    if (name != null) {
      saveAttributeInFirebase(name);
    }
  }

  Future<void> saveVariant(VariantAttributeModel attribute) async {
    VariantVariantModel? variant = await addVariation(attribute);

    if (variant != null) {
      saveVariantInFirebase(variant);
    }
  }

  Future<void> saveVariantInFirebase(VariantVariantModel variant) async {
    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, dynamic> response = await _repository.saveVariantInFirebase(
      variant: variant,
      productId: product.id,
    );

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');
      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
      });
    });
  }

  Future<void> saveAttributeInFirebase(String name) async {
    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, dynamic> response =
        await _repository.saveAttributeInFirebase(name: name);

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
      });
    });
  }

  Future<void> onSave() async {
    Map<String, List<String>> attributeValuesMap = {};
    List<Map<String, dynamic>> attributes = [];
    List<Map<String, dynamic>> variations = [];

    for (var attribute in listAttributes) {
      List<VariantVariantModel> selectedVariants = getVariations(attribute)
          .where((variant) => variantChecked[variant.id] == true)
          .toList();

      if (selectedVariants.isNotEmpty) {
        attributeValuesMap[attribute.name] =
            selectedVariants.map((variant) => variant.name).toList();

        attributes.add({
          "description": attribute.name,
          "values": selectedVariants.map((variant) => variant.name).toList(),
        });
      }
    }

    void generateCombinations(Map<String, List<String>> attributesMap,
        List<String> currentCombination, List<Map<String, dynamic>> result) {
      if (attributesMap.isEmpty) {
        result.add({"attributes": List.of(currentCombination)});
        return;
      }

      String currentAttribute = attributesMap.keys.first;
      List<String> values = attributesMap[currentAttribute]!;

      Map<String, List<String>> remainingAttributes = Map.of(attributesMap)
        ..remove(currentAttribute);

      for (String value in values) {
        generateCombinations(
            remainingAttributes, [...currentCombination, value], result);
      }
    }

    generateCombinations(attributeValuesMap, [], variations);

    Map<String, dynamic> finalJson = {
      "id": product.id,
      "attributes": attributes,
      "variations": variations.map((comb) {
        return buildVariant(
          attributes: comb["attributes"],
          product: product,
        );
      }).toList(),
      "warehouseID": product.warehouseID,
    };

    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, dynamic> response =
        await _repository.updateProductVariations(requestBody: finalJson);

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');
      _mainController.setDropiDialog(false);
      _mainController.setDropiMessage('Guardando en Firebase');
      await _repository.saveCombinations(product: product);
      _mainController.setDropiMessage('Success!');

      onSaveInfoInFirebase();
    });
  }

  Map<String, dynamic> buildVariant({
    required List<String> attributes,
    required ProductFirebaseModel product,
  }) {
    double? price = product.price;
    double? suggestedPrice = product.suggestedPrice;
    int? stock = 1;
    int? points = product.points;
    if (listCombination != null) {
      ProductVariantModel? currentCombination = findCombination(attributes);

      if (currentCombination != null) {
        price = currentCombination.sale_price;
        suggestedPrice = currentCombination.suggested_price;
        stock = currentCombination.stock;
        points = currentCombination.points;
      }
    }

    return {
      "attributes": attributes,
      "cost": price,
      "value": suggestedPrice,
      "stock": stock,
      "points": points,
    };
  }

  ProductVariantModel? findCombination(List<String> attributes) {
    Map<String, bool> mapAttributes = {};

    for (String value in attributes) {
      mapAttributes[value] = true;
    }

    for (ProductVariantModel element in listCombination!) {
      int quantityAttributes = 0;
      for (Map<String, dynamic> value in element.values) {
        String attributeValue = value['value'];

        if (mapAttributes[attributeValue] ?? false) {
          quantityAttributes++;
        }
      }

      if (quantityAttributes == mapAttributes.length) {
        return element;
      }
    }
    return null;
  }

  Future<void> onSaveInfoInFirebase() async {
    List<VariantAttributeModel> selectedAttributes = [];
    List<VariantVariantModel> selectedVariants = [];

    for (var attribute in listAttributes) {
      List<VariantVariantModel> variantsForAttribute = getVariations(attribute)
          .where((variant) => variantChecked[variant.id] == true)
          .toList();

      if (variantsForAttribute.isNotEmpty) {
        selectedAttributes.add(attribute);
        selectedVariants.addAll(variantsForAttribute);
      }
    }

    Map<String, dynamic> finalJson = {
      'attributes': selectedAttributes.map((attr) => attr.toJson()).toList(),
      'variants': selectedVariants.map((variant) {
        VariantVariantModel currentVariant = buildVariantVariantModel(variant);
        return currentVariant.toJson();
      }).toList(),
    };

    _mainController.setDropiMessage('Guardando Información de Variantes');

    Either<String, dynamic> response =
        await _repository.saveVariantsInfoInFirebase(
      productId: product.id,
      body: finalJson,
    );

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
        Get.back();
      });
    });
  }

  VariantVariantModel buildVariantVariantModel(VariantVariantModel variant) {
    if (variantInfoModel != null) {
      VariantVariantModel? matchingVariant = variantInfoModel!.variants!
          .firstWhereOrNull((v) => v.name == variant.name);

      if (matchingVariant != null) {
        return variant.copyWith(imageUrl: matchingVariant.imageUrl);
      }
    }

    return variant;
  }

  Future<void> openGuideTour() async {
    await FeatureDiscovery.clearPreferences(Get.context!, [
      'feature_variations_appbar_button',
    ]);
    FeatureDiscovery.discoverFeatures(
      Get.context!,
      ['feature_variations_appbar_button'],
    );
  }
}
