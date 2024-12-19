import 'package:get/get.dart';

import '../controllers/set_permissions_controller.dart';

class SetPermissionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPermissionsController>(
      () => SetPermissionsController(),
    );
  }
}
