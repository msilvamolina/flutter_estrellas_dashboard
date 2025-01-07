import 'package:get/get.dart';

import '../controllers/copy_departments_controller.dart';

class CopyDepartmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CopyDepartmentsController>(
      () => CopyDepartmentsController(),
    );
  }
}
