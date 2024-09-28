import 'package:the_mariscal/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  MainController mainController = Get.find();
  @override
  void onInit() {
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

  void changeThemeMode() {
    mainController.changeThemeMode();
    update(['view']);
  }
}
