import 'package:get/get.dart';

import '../controllers/providers_list_controller.dart';

class ProvidersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidersListController>(
      () => ProvidersListController(),
    );
  }
}
