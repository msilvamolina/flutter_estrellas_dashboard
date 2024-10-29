import 'package:get/get.dart';

import '../controllers/product_variants_controller.dart';

class ProductVariantsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductVariantsController>(
      () => ProductVariantsController(),
    );
  }
}
