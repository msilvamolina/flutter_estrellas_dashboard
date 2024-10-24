import 'package:get/get.dart';

import '../controllers/create_warehouse_controller.dart';

class CreateWarehouseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWarehouseController>(
      () => CreateWarehouseController(),
    );
  }
}
