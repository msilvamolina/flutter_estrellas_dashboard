import 'package:get/get.dart';

import '../controllers/test_login_app_dropi_controller.dart';

class TestLoginAppDropiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestLoginAppDropiController>(
      () => TestLoginAppDropiController(),
    );
  }
}
