import 'package:get/get.dart';

import '../controllers/providers_warehouses_controller.dart';

class ProvidersWarehousesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidersWarehousesController>(
      () => ProvidersWarehousesController(),
    );
  }
}
