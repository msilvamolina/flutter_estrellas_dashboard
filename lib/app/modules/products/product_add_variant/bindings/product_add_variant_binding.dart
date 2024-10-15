import 'package:get/get.dart';

import '../controllers/product_add_variant_controller.dart';

class ProductAddVariantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductAddVariantController>(
      () => ProductAddVariantController(),
    );
  }
}
