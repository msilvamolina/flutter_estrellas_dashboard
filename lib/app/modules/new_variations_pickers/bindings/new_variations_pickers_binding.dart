import 'package:get/get.dart';

import '../controllers/new_variations_pickers_controller.dart';

class NewVariationsPickersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewVariationsPickersController>(
      () => NewVariationsPickersController(),
    );
  }
}
