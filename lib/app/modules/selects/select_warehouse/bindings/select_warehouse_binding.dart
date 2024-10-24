import 'package:get/get.dart';

import '../controllers/select_warehouse_controller.dart';

class SelectWarehouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectWarehouseController>(
      () => SelectWarehouseController(),
    );
  }
}
