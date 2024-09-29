import 'package:get/get.dart';

import '../controllers/test_endpoints_controller.dart';

class TestEndpointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestEndpointsController>(
      () => TestEndpointsController(),
    );
  }
}
