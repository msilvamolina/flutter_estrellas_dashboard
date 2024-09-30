import 'package:estrellas_dashboard/app/app/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<UserController>(UserController());
  }
}
