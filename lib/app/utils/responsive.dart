import 'package:flutter/material.dart';

class Responsive {
  Responsive();

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static bool isTinyPhone(BuildContext context) {
    return screenWidth(context) < 320;
  }

  static bool isMobile(BuildContext context) {
    return screenWidth(context) < 480;
  }

  static bool isTablet(BuildContext context) {
    return screenWidth(context) < 740;
  }

  static bool isTablet2(BuildContext context) {
    return screenWidth(context) < 890;
  }

  static bool isDesktop(BuildContext context) {
    return screenWidth(context) > 720;
  }
}
