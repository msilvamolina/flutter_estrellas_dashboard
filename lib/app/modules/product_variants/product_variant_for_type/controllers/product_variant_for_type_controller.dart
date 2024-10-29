import 'package:get/get.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';

enum VariantsTypes {
  color('color'),
  size('size');

  const VariantsTypes(this.text);
  final String text;
}

class ProductVariantForTypeController extends GetxController {
  late VariantsTypes typeSelected;
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();

  @override
  void onInit() {
    typeSelected = Get.arguments as VariantsTypes;
    // product = Get.arguments as ProductFirebaseModel;
    // _list.bindStream(_repository.getProductVariants(productId: product.id));

    super.onInit();
  }
}
