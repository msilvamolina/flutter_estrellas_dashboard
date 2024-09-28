import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/services/theme_service.dart';
import 'package:get/get.dart';

import '../app/controllers/main_controller.dart';

class CustomInputDecoration {
  static InputDecoration inputDecoration({
    required bool isThemeModeDark,
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
}
