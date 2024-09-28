import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Snackbars {
  Snackbars._();

  static void error(String error) {
    Get.snackbar(
      'Upps, ocurrió un error',
      error,
      maxWidth: 600,
      margin: const EdgeInsets.all(16),
      // colorText: white,
      backgroundColor: Colors.red.withOpacity(0.5),
    );
  }

  static void success(String msg) {
    Get.snackbar(
      'Great!',
      msg,
      maxWidth: 600,
      margin: const EdgeInsets.all(16),
      // colorText: white,
      backgroundColor: Colors.green.withOpacity(0.5),
    );
  }
}
