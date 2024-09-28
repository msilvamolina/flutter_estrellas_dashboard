import 'package:flutter/material.dart';
import 'package:the_mariscal/app/app/dialogs/login/login_screen.dart';
import 'package:the_mariscal/app/components/layouts/auth_layout.dart';
import 'package:the_mariscal/app/modules/auth/login/controllers/login_controller.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      id: 'view',
      builder: (controller) {
        return AuthLayout(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                GetBuilder<MainController>(
                  id: 'themeButton',
                  builder: (mainController) {
                    return IconButton(
                      onPressed: mainController.changeThemeColor,
                      icon: const Icon(Icons.color_lens),
                    );
                  },
                ),
                GetBuilder<MainController>(
                  id: 'themeButton',
                  builder: (mainController) {
                    return IconButton(
                      onPressed: controller.changeThemeMode,
                      icon: Icon(mainController.getThemeIcon()),
                    );
                  },
                ),
                Hero(
                  tag: 'helpButton',
                  child: IconButton(
                    onPressed: controller.mainController.openAlertHelpText,
                    icon: Icon(Icons.help_outline),
                  ),
                ),
              ],
            ),
            body: Center(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: LoginScreen(),
            )),
          ),
        );
      },
    );
  }
}
