import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/components/dialogs/loader_dialog.dart';
import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/auth/user_repository.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:get/get.dart';
import 'package:estrellas_dashboard/app/themes/themes/black.dart';

import '../../components/dialogs/dropi_dialog.dart';
import '../../components/snackbars/snackbars.dart';
import '../../data/models/theme_model.dart';
import '../../data/models/user_data/user_data.dart';
import '../../services/theme_service.dart';
import '../dialogs/change_color_dialog.dart';

enum UserStatus {
  loading,
  notLogged,
  needBasicData,
  full,
}

class MainController extends GetxController {
  LocalStorage localStorage = Get.find();
  UserRepository userRepository = UserRepository();
  bool _withVolume = true;
  bool get withVolume => _withVolume;

  UserStatus _userStatus = UserStatus.loading;
  UserStatus get userStatus => _userStatus;

  UserData? _userData;
  UserData? get userData => _userData;

  bool _isWelcome = false;
  bool _isThemeModeDark = false;

  String? _token;
  String? get token => _token;

  bool get isThemeModeDark => _isThemeModeDark;

  RxBool isThemeModeDark2 = false.obs;

  dynamic _themeColor;
  dynamic get themeColor => _themeColor;

  RxString dropiMessage = ''.obs;

  @override
  Future<void> onInit() async {
    _isWelcome = await localStorage.getWelcome();
    super.onInit();
  }

  @override
  void onReady() async {
    checkTheme();

    checkUser();
    super.onReady();
  }

  void setToken(String value) {
    _token = value;
  }

  void setDropiMessage(String message) {
    dropiMessage?.value = message;
  }

  void checkTheme() {
    _isThemeModeDark = ThemeService.isSavedDarkMode();
    _themeColor = ThemeService.getTheme();
    update(['view']);
  }

  void onChangeColorTheme(ThemeModel themeModel) {
    _themeColor = themeModel;
    if (_isThemeModeDark) {
      Get.changeTheme(_themeColor.theme.dark(Get.context));
    } else {
      Get.changeTheme(_themeColor.theme.light(Get.context));
    }
    ThemeService.saveThemeColor(_themeColor.id);
    Get.forceAppUpdate();
  }

  void changeThemeMode() {
    if (_isThemeModeDark) {
      Get.changeTheme(_themeColor.theme.light(Get.context));
    } else {
      Get.changeTheme(_themeColor.theme.dark(Get.context));
    }
    _isThemeModeDark = !_isThemeModeDark;
    ThemeService.changeThemeMode();
    isThemeModeDark2.value = !isThemeModeDark2.value;
    Get.forceAppUpdate();
  }

  Future<void> checkUser({bool login = false}) async {
    _userStatus = UserStatus.loading;
    update(['login']);
    bool isAuthenticated = userRepository.isUserLogged();

    if (isAuthenticated) {
      _userData = await userRepository.getUserDataFirebase();
      _userStatus = UserStatus.full;
    } else {
      _userStatus = UserStatus.notLogged;
    }

    update(['login']);

    if (_userStatus == UserStatus.notLogged) {
      Get.offAllNamed(Routes.LOGIN);
    }

    if (_userStatus == UserStatus.full) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  IconData getThemeIcon() {
    return isThemeModeDark ? Icons.light_mode : Icons.dark_mode;
  }

  void signOut() {
    String theme = ThemeService.readSavedTheme();
    _userStatus = UserStatus.loading;
    update(['login']);
    userRepository.signOut();
    Future.delayed(Duration(milliseconds: 500), () {
      _userStatus = UserStatus.notLogged;
      update(['login']);
      ThemeService.saveThemeMode(_isThemeModeDark);
      ThemeService.saveThemeColor(theme);
      checkUser();
    });
  }

  void changeThemeColor() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ChangeColorDialog();
      },
    );
  }

  void openAlertHelpText() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              '¿Necesitas ayuda?',
              style: TypographyStyle.h3Mobile,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                  Text('¿Necesitas ayuda?'),
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text("Aceptar"),
                onPressed: () {},
              )
            ],
          );
        });
  }

  void changeVolume() {
    _withVolume = !_withVolume;
    update();
  }

  void showLoader({String? title, String? message}) {
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return LoaderDialog(title: title, message: message);
      },
    );
  }

  void showDropiLoader() {
    setDropiMessage('Espero un momento por favor');
    showDialog(
      barrierColor: Colors.transparent,
      context: Get.context!,
      builder: (BuildContext context) {
        return const LoaderDropiDialog();
      },
    );
  }
}
