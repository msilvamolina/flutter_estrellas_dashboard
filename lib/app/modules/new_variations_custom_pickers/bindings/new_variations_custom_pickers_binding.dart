import 'package:get/get.dart';

import '../controllers/new_variations_custom_pickers_controller.dart';

class NewVariationsCustomPickersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewVariationsCustomPickersController>(
      () => NewVariationsCustomPickersController(),
    );
  }
}
