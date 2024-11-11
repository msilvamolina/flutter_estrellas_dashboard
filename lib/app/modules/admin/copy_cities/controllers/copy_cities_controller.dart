import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:get/get.dart';

class CopyCitiesController extends GetxController {
  late DepartmentModel departmentModel;
  @override
  void onInit() {
    departmentModel = Get.arguments as DepartmentModel;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void copyToFirebase() {}
}
