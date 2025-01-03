import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../data/models/product/product_firebase/product_firebase_model.dart';
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

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;

    _list.bindStream(_repository.getAttributes());
    _listVariations.bindStream(_repository.getVariant());
    super.onInit();
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

  Future<void> openGuideTour() async {
    await FeatureDiscovery.clearPreferences(Get.context!, [
      'feature_icon_button',
      'feature_floating_action',
    ]);
    FeatureDiscovery.discoverFeatures(
      Get.context!,
      ['feature_icon_button', 'feature_floating_action'],
    );
  }
}
