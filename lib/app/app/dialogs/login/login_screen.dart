import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../components/logo/logo.dart';
import '../../../services/theme_service.dart';
import '../../../themes/input_decoration.dart';
import '../../../themes/styles/typography.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.isDialog = false});

  final bool isDialog;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginDialogController>(
        init: LoginDialogController(),
        builder: (controller) {
          return Stack(
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
                            SizedBox(height: 16),
                            Text(
                              'Holis :D',
                              textAlign: TextAlign.center,
                              style: TypographyStyle.h1Mobile
                                  .copyWith(fontWeight: FontWeight.w700),
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
                                        ? () => controller.sendForm(form.value)
                                        : null,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      width: double.infinity,
                                      child: Text(
                                        'Iniciar sesión',
                                        textAlign: TextAlign.center,
                                        style: TypographyStyle.bodyRegularLarge
                                            .copyWith(
                                                fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 120),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          );
        });
  }
}
