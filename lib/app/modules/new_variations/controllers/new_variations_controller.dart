import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/dialogs/dropi_dialog.dart';
import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/variant_attributte/variant_attributte.dart';
import '../../../data/models/variant_info/variant_info.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../data/providers/repositories/products/products_repository.dart';
import '../../../app/dialogs/tip_dialog.dart';

class NewVariationsController extends GetxController {
  MainController mainController = Get.find<MainController>();
  late ProductFirebaseModel product;
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();

  ProductsRepository _repository =
      ProductsRepository(); // Repositorio de productos
  VariantInfoModel? variantInfoModel;
  RxBool isLoading = true.obs;

  @override
  Future<void> onInit() async {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getAllProductVariants(
      productId: product.id,
    ));
    variantInfoModel = await _repository.getVariantsInfo(product.id);

    if (variantInfoModel != null) {
      mainController.openTipDialog(
        title: "Agrega una imagen a la variante",
        message:
            "Si le haces clic a una variante, vas a poder cargar una imagen",
      );
    }
    isLoading.value = false;
    update(['view']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  List<VariantVariantModel> getVariations(VariantAttributeModel attribute) {
    return variantInfoModel!.variants!
        .where((variant) => variant.attributeId == attribute.id)
        .toList();
  }
}
