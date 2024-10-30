import 'package:get/get.dart';

import '../controllers/product_variant_for_type_controller.dart';

class ProductVariantForTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductVariantForTypeController>(
      () => ProductVariantForTypeController(),
    );
  }
}
