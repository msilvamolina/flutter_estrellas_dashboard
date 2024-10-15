import 'package:get/get.dart';

import '../controllers/product_images_controller.dart';

class ProductImagesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductImagesController>(
      () => ProductImagesController(),
    );
  }
}
