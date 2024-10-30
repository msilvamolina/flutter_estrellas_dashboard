import 'package:get/get.dart';

import '../controllers/edit_product_variant_combination_controller.dart';

class EditProductVariantCombinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProductVariantCombinationController>(
      () => EditProductVariantCombinationController(),
    );
  }
}
