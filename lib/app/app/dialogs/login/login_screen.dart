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
    Color primaryColor = Theme.of(context).colorScheme.primary;
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
                            if (isDialog)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.help_outline),
                                  ),
                                ],
                              ),
                            Center(
                              child: LogoApp(
                                size: 180,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              '¡Bienvenido al\nMariscal!',
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
                            SizedBox(height: 8),
                            TextButton(
                              onPressed: () {},
                              child: Text('Olvidé mi contraseña',
                                  style: TypographyStyle.linkRegularLarge),
                            ),
                            SizedBox(height: 26),
                            GetBuilder<MainController>(
                              id: 'input',
                              builder: (_) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Hero(
                                      tag: 'buttonGoogle',
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          primaryColor,
                                          BlendMode
                                              .srcIn, // Aplica el color a la imagen
                                        ),
                                        child: Image.asset(
                                          'assets/images/google.png',
                                          width: 46,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Hero(
                                      tag: 'buttonApple',
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          primaryColor,
                                          BlendMode
                                              .srcIn, // Aplica el color a la imagen
                                        ),
                                        child: Image.asset(
                                          'assets/images/apple.png',
                                          width: 46,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Hero(
                                      tag: 'buttonFacebook',
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          primaryColor,
                                          BlendMode
                                              .srcIn, // Aplica el color a la imagen
                                        ),
                                        child: Image.asset(
                                          'assets/images/facebook.png',
                                          width: 46,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            SizedBox(height: 36),
                            ElevatedButton(
                              onPressed: controller.openRegisterDialog,
                              child: Container(
                                padding: EdgeInsets.all(8),
                                width: double.infinity,
                                child: Text(
                                  'Regístrate',
                                  textAlign: TextAlign.center,
                                  style: TypographyStyle.bodyRegularLarge
                                      .copyWith(fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
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
