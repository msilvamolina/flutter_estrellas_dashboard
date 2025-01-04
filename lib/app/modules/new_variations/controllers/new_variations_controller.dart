import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:feature_discovery/feature_discovery.dart';
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
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();

  final RxList<ProductVariantAttributesModel> _listAttributes =
      <ProductVariantAttributesModel>[].obs;
  List<ProductVariantAttributesModel> get listAttributes =>
      _listAttributes.toList();

  ProductsRepository _repository = ProductsRepository();
  VariantInfoModel? variantInfoModel;
  RxBool isLoading = true.obs;

  RxBool showSaveButton = false.obs;

  @override
  Future<void> onInit() async {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getAllProductVariants(productId: product.id));
    _listAttributes.bindStream(
        _repository.getAllProductVariantAttributes(productId: product.id));

    await loadInfo();

    if (variantInfoModel != null) {
      _mainController.openTipDialog(
        title: "Agrega una imagen a la variante",
        message:
            "Si le haces clic a una variante, vas a poder cargar una imagen",
      );
    } else {
      openGuideTour();
    }
    isLoading.value = false;
    update(['view']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

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

  Future<void> openGuideTour() async {
    await FeatureDiscovery.clearPreferences(Get.context!, [
      'feature_icon_button',
    ]);
    FeatureDiscovery.discoverFeatures(
      Get.context!,
      ['feature_icon_button'],
    );
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
      }, (imageUrl) async {
        _mainController.setDropiMessage('Success!');

        buildVariantsInfo(
          id: variant.id,
          imageUrl: imageUrl,
        );
      });
    }
  }

  Future<void> createVariants() async {
    await Get.toNamed(
      Routes.NEW_VARIATIONS_CUSTOM_PICKERS,
      arguments: product,
    );
    loadInfo();
  }

  Future<void> buildVariantsInfo(
      {required String id, required String imageUrl}) async {
    Map<String, dynamic> finalJson = {
      'attributes':
          variantInfoModel!.attributes!.map((attr) => attr.toJson()).toList(),
      'variants': variantInfoModel!.variants!.map((variant) {
        if (variant.id == id) {
          return variant.copyWith(imageUrl: imageUrl).toJson();
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
