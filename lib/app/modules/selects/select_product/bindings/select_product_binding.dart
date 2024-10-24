import 'package:get/get.dart';

import '../controllers/select_product_controller.dart';

class SelectProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectProductController>(
      () => SelectProductController(),
    );
  }
}
