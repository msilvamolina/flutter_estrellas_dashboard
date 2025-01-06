import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/dialogs/tip_dialog.dart';
import 'package:estrellas_dashboard/app/services/user_permissions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/components/dialogs/loader_dialog.dart';
import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/auth/user_repository.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:estrellas_dashboard/app/themes/themes/black.dart';
import 'package:local_auth/local_auth.dart';

import '../../components/dialogs/dropi_dialog.dart';
import '../../components/snackbars/snackbars.dart';
import '../../data/models/theme_model.dart';
import '../../data/models/user_data/user_data.dart';
import '../../data/providers/repositories/auth/auth_repository.dart';
import '../../services/theme_service.dart';
import '../../utils/encrypt.dart';
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
  final AuthRepository _authRepository = AuthRepository();

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
  RxBool dropiDialog = true.obs;

  RxString dropiDialogError = ''.obs;
  RxBool dropiDialogIsError = false.obs;

  bool _isFaceIdEnabled = false;
  bool get isFaceIdEnabled => _isFaceIdEnabled;
  final LocalAuthentication auth = LocalAuthentication();
  bool? _canCheckBiometrics;

  List<String> _userPermissions = [];
  List<String> get userPermissions => _userPermissions;

  @override
  Future<void> onInit() async {
    _isWelcome = await localStorage.getWelcome();
    _isFaceIdEnabled = await localStorage.getFaceIdEnabled();
    super.onInit();
  }

  void onChangedUserPermissions(List<String> permissions) {
    _userPermissions.clear();
    _userPermissions.addAll(permissions);
  }

  bool checkUserPermission(Permissions check) {
    return _userPermissions.contains(check.name);
  }

  @override
  void onReady() async {
    checkTheme();
    _checkBiometrics();

    checkUser();
    super.onReady();
  }

  Future<void> changeFaceId() async {
    if (_canCheckBiometrics ?? false) {
      print('holis');

      _faceIdauthenticate();
    }
  }

  Future<void> _faceIdauthenticate() async {
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
        localizedReason:
            'Scan your fingerprint (or face or whatever) to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          useErrorDialogs: false,
          sensitiveTransaction: false,
        ),
      );
    } on PlatformException catch (e) {
      print(e);
    }

    if (authenticated) {
      openChangeFaceId();
    }
  }

  Future<void> openChangeFaceId() async {
    final result = await showTextInputDialog(
      context: Get.context!,
      textFields: [
        DialogTextField(
          hintText: 'Ingresa tu contraseña',
          obscureText: true,
        ),
      ],
      title: 'Contraseña',
      message: 'Por favor ingresa tu contraseña para continuar',
      okLabel: 'Enviar',
      cancelLabel: 'Cancel',
    );

    if (result != null && result.isNotEmpty) {
      loginUser(result.first);
    }
  }

  Future<void> loginUser(String password) async {
    showLoader(
      title: 'Verificando',
      message: 'Por favor espere',
    );
    String email = await localStorage.getFaceEmail();

    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        Snackbars.error(failure);
      },
      (response) async {
        String _pass = Encrypt.encryptString(password);

        await localStorage.saveFaceP(_pass);
        Get.back();

        _isFaceIdEnabled = !_isFaceIdEnabled;
        await localStorage.saveFaceIdEnabled(_isFaceIdEnabled);
        update(['changeFaceId']);
        if (_isFaceIdEnabled) {
          Snackbars.success("¡Face ID habilitado correctamente!");
        } else {
          Snackbars.success("¡Face ID deshabilitado correctamente!");
        }
      },
    );
  }

  Future<void> _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    _canCheckBiometrics = canCheckBiometrics;
  }

  void setToken(String value) {
    _token = value;
  }

  void setDropiMessage(String message) {
    dropiMessage.value = message;
  }

  void setDropiDialog(bool value) {
    dropiDialog.value = value;
  }

  void setDropiDialogError(bool value, String message) {
    dropiDialogIsError.value = value;
    dropiDialogError.value = message;
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
    } else {
      userRepository.signOut();
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> openTipDialog({
    required String featureId,
    required String title,
    required String message,
  }) async {
    bool userWantToSee = await localStorage.getGuideTourStatus(featureId);

    if (userWantToSee) {
      showDialog(
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (BuildContext context) {
          return TipDialog(
            featureId: featureId,
            title: title,
            message: message,
          );
        },
      );
    }
  }

  IconData getThemeIcon() {
    return isThemeModeDark ? Icons.light_mode : Icons.dark_mode;
  }

  Future<void> signOut() async {
    final result = await showDialog<bool>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmación'),
          content: const Text('¿Estás seguro de que deseas salir?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Cancelar
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirmar
              },
              child: const Text('Salir'),
            ),
          ],
        );
      },
    );

    if (result == true) {
      // Acción a realizar si el usuario confirma salir
      signOutApp();
    }
  }

  void signOutApp() {
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
    setDropiDialogError(false, '');
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
