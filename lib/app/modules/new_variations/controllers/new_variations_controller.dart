import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/product_variant_attributes/product_variant_attributes.dart';
import '../../../data/models/variant_attributte/variant_attributte.dart';
import '../../../data/models/variant_info/variant_info.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../data/providers/repositories/products/products_repository.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utils_image.dart';
import '../dialogs/edit_variation_dialog.dart';

class NewVariationsController extends GetxController {
  MainController _mainController = Get.find<MainController>();
  late ProductFirebaseModel product;
  ProductsRepository _repository = ProductsRepository();

  LocalStorage localStorage = Get.find<LocalStorage>();
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();
  final RxList<ProductVariantAttributesModel> _listAttributes =
      <ProductVariantAttributesModel>[].obs;
  List<ProductVariantAttributesModel> get listAttributes =>
      _listAttributes.toList();
  VariantInfoModel? variantInfoModel;

  RxBool isLoading = true.obs;

  RxBool showSaveButton = false.obs;

  @override
  Future<void> onInit() async {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getAllProductVariants(productId: product.id));
    _listAttributes.bindStream(
        _repository.getAllProductVariantAttributes(productId: product.id));

    ever<List<ProductVariantModel>>(_list, (variantList) {
      if (variantList.isNotEmpty && variantList.length > 1) {
        Future.delayed(Duration(seconds: 2), () {
          _mainController.openTipDialog(
            featureId: 'addVariants',
            title: 'Cambiar orden',
            message:
                'Manteniendo el clic en una imágen, puedes arratrarla hasta el lugar donde quieres que se muestra',
          );
        });
      }
    });
    await loadInfo();

    isLoading.value = false;
    update(['view']);
    super.onInit();
  }

  @override
  void onReady() {
    openGuideTour();
    super.onReady();
  }

  Future<void> changeDefaultVariant(ProductVariantModel variation) async {
    final result = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cambiar variación predeterminada'),
          content: const Text(
              '¿Estás seguro de que deseas elegir esta variación como predeterminada?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirmar
              },
              child: const Text('Cambiar'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      // Acción a realizar si el usuario confirma salir
      changeDefaultVariantAction(variation);
    }
  }

  Future<void> changeDefaultVariantAction(
      ProductVariantModel variation) async {}

  Future<void> editVariation(ProductVariantModel variation) async {
    ProductVariantModel? newVariation = await editVariationDialog(variation);

    if (newVariation != null) {
      int index = _list.indexWhere((v) => v.id == variation.id);

      if (index != -1) {
        _list[index] = newVariation;

        _list.refresh();
        showSaveButton.value = true;
      }
    }
  }

  Future<void> loadInfo() async {
    variantInfoModel = await _repository.getVariantsInfo(product.id);
    update(['view']);
  }

  String guideTourName = 'feature_variant_icon_button';
  Future<void> openGuideTour() async {
    bool userWantToSee = await localStorage.getGuideTourStatus(guideTourName);

    if (userWantToSee) {
      await FeatureDiscovery.clearPreferences(Get.context!, [
        guideTourName,
      ]);
      FeatureDiscovery.discoverFeatures(
        Get.context!,
        [guideTourName],
      );
    }
  }

  VariantVariantModel? getVariationWithName(String name) {
    return variantInfoModel!.variants!.firstWhereOrNull(
      (variant) => variant.name == name,
    );
  }

  List<VariantVariantModel> getVariations(VariantAttributeModel attribute) {
    return variantInfoModel!.variants!
        .where((variant) => variant.attributeId == attribute.id)
        .toList();
  }

  Future<void> onCardPressed(VariantVariantModel variant) async {
    String? _imagePath = await UtilsImage.pickImage();
    if (_imagePath != null) {
      _mainController.setDropiDialog(false);
      _mainController.showDropiLoader();
      _mainController.setDropiMessage('Iniciando conexión');

      Either<String, dynamic> response = await _repository.saveImageVariants(
        variantId: variant.id,
        productId: product.id,
        imagePath: _imagePath,
      );

      response.fold((failure) {
        _mainController.setDropiDialogError(true, failure);
      }, (imagesMap) async {
        _mainController.setDropiMessage('Success!');

        buildVariantsInfo(
          id: variant.id,
          imagesMap: imagesMap,
        );
      });
    }
  }

  Future<void> createVariants() async {
    await Get.toNamed(
      Routes.NEW_VARIATIONS_CUSTOM_PICKERS,
      arguments: [product, list],
    );
    loadInfo();
  }

  Future<void> buildVariantsInfo({
    required String id,
    required Map<String, String>? imagesMap,
  }) async {
    Map<String, dynamic> finalJson = {
      'attributes':
          variantInfoModel!.attributes!.map((attr) => attr.toJson()).toList(),
      'variants': variantInfoModel!.variants!.map((variant) {
        if (variant.id == id) {
          String thumb = imagesMap?['80x80'] ?? '';
          String standardImage = imagesMap?['400x400'] ?? '';
          String fullImage = imagesMap?['800x800'] ?? '';

          return variant
              .copyWith(
                imageUrl: thumb,
                standardImage: standardImage,
                fullImage: fullImage,
              )
              .toJson();
        } else {
          return variant.toJson();
        }
      }).toList(),
    };

    _mainController.setDropiMessage('Guardando información');

    Either<String, dynamic> response =
        await _repository.saveVariantsInfoInFirebase(
      productId: product.id,
      body: finalJson,
    );

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () async {
        Get.back();
        await loadInfo();
      });
    });
  }

  Map<String, dynamic> buildJson() {
    Map<String, dynamic> finalJson = {};

    List<Map<String, dynamic>> listNewAttributes = [];
    List<Map<String, dynamic>> listNewVariants = [];

    for (ProductVariantAttributesModel element in _listAttributes) {
      List<String> listAttributes = [];
      for (dynamic attribute in element.values) {
        listAttributes.add(attribute['value']);
      }
      listNewAttributes.add({
        "description": element.description,
        "values": listAttributes.toList(),
      });
    }

    for (ProductVariantModel element in _list) {
      List<String> listAttributes = [];
      for (dynamic attribute in element.values) {
        listAttributes.add(attribute['value']);
      }
      listNewVariants.add({
        "attributes": listAttributes.toList(),
        "cost": element.sale_price,
        "value": element.suggested_price,
        "stock": element.stock,
        "points": element.points,
      });
    }

    finalJson["id"] = product.id;
    finalJson["warehouseID"] = product.warehouseID;
    finalJson["attributes"] = listNewAttributes.toList();
    finalJson["variations"] = listNewVariants.toList();

    return finalJson;
  }

  Future<void> saveVariants() async {
    Map<String, dynamic> finalJson = buildJson();

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
      await _repository.updateFirebaseCombinations(product: product);
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
      });
    });
  }
}
