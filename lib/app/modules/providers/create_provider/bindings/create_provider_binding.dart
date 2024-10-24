import 'package:get/get.dart';

import '../controllers/create_provider_controller.dart';

class CreateProviderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateProviderController>(
      () => CreateProviderController(),
    );
  }
}
