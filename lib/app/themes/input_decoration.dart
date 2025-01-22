import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/services/theme_service.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../app/controllers/main_controller.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    bool? isThemeModeDark,
    String? text,
    String? hintText,
    IconData? icon,
  }) =>
      InputDecoration(
        filled: true,
        labelText: text,
        hintText: hintText,
        prefixIcon: icon != null
            ? Icon(
                icon,
              )
            : null,
      );

  static InputDecoration inputDecorationControl({
    String? text,
    String? hintText,
    IconData? icon,
    bool? isThemeModeDark,
    bool isSubmited = false,
    Widget? suffixIcon,
    required FormControl control,
  }) {
    MainController mainController = Get.find<MainController>();

    return InputDecoration(
      filled: true,
      labelText: text,
      hintText: hintText,
      suffixIcon: suffixIcon,
      prefixIcon: icon != null
          ? Icon(
              icon,
            )
          : null,
    );
  }
}
