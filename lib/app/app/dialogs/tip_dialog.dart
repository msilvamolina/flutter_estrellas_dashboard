import 'dart:ui';

import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/components/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:get/get.dart';

class TipDialog extends StatelessWidget {
  const TipDialog({
    required this.title,
    required this.message,
    super.key,
  });

  final String title;
  final String message;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    Color backgroundColor =
        mainController.isThemeModeDark ? Colors.black : Colors.white;
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
            child: Container(
              color: backgroundColor.withOpacity(0.5),
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/helpful-tips.png',
                  width: 160,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TypographyStyle.h2Mobile,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(message,
                      textAlign: TextAlign.center,
                      style: TypographyStyle.bodyRegularLarge),
                ),
                SizedBox(height: 16),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Button(onPressed: Get.back, label: 'Entendido')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
