import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_mariscal/app/themes/themes.dart';
import 'package:the_mariscal/app/themes/themes/black.dart';
import 'package:the_mariscal/app/themes/themes/pink.dart';
import 'package:the_mariscal/app/themes/themes/red.dart';

import '../data/models/theme_model.dart';

class ThemeService {
  ThemeService._();
  static final _getStorage = GetStorage();
  static const storageKey = 'isDarkMode';
  static const colorKey = 'themeColor';

  static ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  static bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ??
        (SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark);
  }

  static String readSavedTheme() {
    return _getStorage.read(colorKey) ?? 'black';
  }

  static void saveThemeMode(bool isDarkMode) {
    _getStorage.write(storageKey, isDarkMode);
  }

  static void saveThemeColor(String value) {
    _getStorage.write(colorKey, value);
  }

  static dynamic getTheme() {
    return getThemeById(readSavedTheme());
  }

  static dynamic getThemeById(String id) {
    var theme = ListThemes.list.where((dynamic t) => t.id == id).firstOrNull;
    if (theme != null) {
      return theme;
    }
    return ListThemes.list[0];
  }

  static void onChangeColor(ThemeModel themeModel) {
    dynamic theme = themeModel.theme;

    Get.changeTheme(isSavedDarkMode() ? theme.dark() : theme.light());
    saveThemeColor(themeModel.id);
  }

  static void changeThemeMode() {
    saveThemeMode(!isSavedDarkMode());
  }
}
