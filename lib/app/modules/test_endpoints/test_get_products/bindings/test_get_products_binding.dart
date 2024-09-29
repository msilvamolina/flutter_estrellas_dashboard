import 'package:get/get.dart';

import '../controllers/test_get_products_controller.dart';

class TestGetProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestGetProductsController>(
      () => TestGetProductsController(),
    );
  }
}
