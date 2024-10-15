import 'package:get/get.dart';

import '../controllers/product_add_image_controller.dart';

class ProductAddImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductAddImageController>(
      () => ProductAddImageController(),
    );
  }
}
