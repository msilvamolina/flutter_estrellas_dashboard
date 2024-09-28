import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_mariscal/app/app/controllers/main_controller.dart';
import 'package:the_mariscal/app/components/logo/logo_img.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({required this.size, super.key});

  final double size;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    bool isDark = mainController.isThemeModeDark;
    Color surface = Theme.of(context).colorScheme.surface;
    Color primary = Theme.of(context).colorScheme.primary;

    Color backgroundImageDark = primary;
    Color colorImageDark = surface;

    Color backgroundImage = surface;
    Color colorImage = primary;

    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      crossFadeState:
          isDark ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: LogoImg(
        size: size,
        backgroundImage: backgroundImageDark,
        colorImage: colorImageDark,
      ),
      secondChild: LogoImg(
        size: size,
        backgroundImage: backgroundImage,
        colorImage: colorImage,
      ),
    );
  }
}
