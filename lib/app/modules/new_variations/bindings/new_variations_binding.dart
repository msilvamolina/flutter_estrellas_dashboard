import 'package:get/get.dart';

import '../controllers/new_variations_controller.dart';

class NewVariationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewVariationsController>(
      () => NewVariationsController(),
    );
  }
}
