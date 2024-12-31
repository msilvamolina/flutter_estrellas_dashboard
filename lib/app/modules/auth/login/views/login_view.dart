import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/modules/auth/login/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/logo/logo.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../themes/styles/typography.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primary;

    return GetBuilder<LoginController>(
      id: 'view',
      builder: (controller) {
        return Scaffold(
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
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: ReactiveFormBuilder(
                        form: controller.buildForm,
                        builder: (context, form, child) {
                          return Container(
                            width: 400,
                            child: ListBody(
                              children: <Widget>[
                                Center(
                                  child: LogoApp(
                                    size: 180,
                                  ),
                                ),
                                SizedBox(height: 26),
                                GetBuilder<MainController>(
                                  id: 'input',
                                  builder: (_) {
                                    return ReactiveTextField(
                                      formControlName: Fields.email.name,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration:
                                          CustomInputDecoration.inputDecoration(
                                        isThemeModeDark: controller
                                            .mainController.isThemeModeDark,
                                        text: "E-mail",
                                        icon: Icons.email,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 16),
                                GetBuilder<MainController>(
                                  id: 'input',
                                  builder: (_) {
                                    return ReactiveTextField(
                                      obscureText: true,
                                      formControlName: Fields.password.name,
                                      keyboardType: TextInputType.text,
                                      decoration:
                                          CustomInputDecoration.inputDecoration(
                                        isThemeModeDark: controller
                                            .mainController.isThemeModeDark,
                                        text: "Contraseña",
                                        icon: Icons.security,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 26),
                                GetBuilder<MainController>(
                                  id: 'input',
                                  builder: (_) {
                                    return ReactiveFormConsumer(
                                      builder: (context, form, child) =>
                                          ElevatedButton(
                                        onPressed: (form.valid &&
                                                controller.buttonEnabled)
                                            ? () =>
                                                controller.sendForm(form.value)
                                            : null,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          width: double.infinity,
                                          child: Text(
                                            'Iniciar sesión',
                                            textAlign: TextAlign.center,
                                            style: TypographyStyle
                                                .bodyRegularLarge
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.w400),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 46),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
