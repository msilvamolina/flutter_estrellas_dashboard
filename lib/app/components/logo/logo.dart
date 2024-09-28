import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/components/logo/logo_img.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({required this.size, super.key});

  final double size;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find();
    bool isDark = mainController.isThemeModeDark;
    Color surface = Theme.of(context).colorScheme.surface;
    Color primary = Theme.of(context).colorScheme.primary;

    Color colorImage = primary;

    return SvgPicture.asset(
      'assets/svg/logo.svg',
      height: 180,
      colorFilter: ColorFilter.mode(
        colorImage,
        BlendMode.srcIn,
      ),
    );
  }
}
