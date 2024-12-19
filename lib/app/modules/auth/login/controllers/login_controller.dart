import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../components/snackbars/snackbars.dart';
import '../../../../data/providers/local/local_storage.dart';
import '../../../../data/providers/repositories/auth/auth_repository.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/encrypt.dart';

enum Fields {
  email('email'),
  password('password');

  const Fields(this.name);
  final String name;
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class LoginController extends GetxController {
  final AuthRepository _authRepository = AuthRepository();

  MainController mainController = Get.find();
  bool _buttonEnabled = true;
  bool get buttonEnabled => _buttonEnabled;
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;

  bool _faceIDEnabled = false;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.email.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
          ],
        ),
        Fields.password.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(8),
          ],
        ),
      });

  @override
  void onInit() async {
    _faceIDEnabled = await _localStorage.getFaceIdEnabled();

    super.onInit();
  }

  @override
  Future<void> onReady() async {
    if (_faceIDEnabled) {
      await auth.isDeviceSupported().then(
            (bool isSupported) => _supportState = isSupported
                ? _SupportState.supported
                : _SupportState.unsupported,
          );

      await _checkBiometrics();

      if (_canCheckBiometrics ?? false) {
        _faceIdauthenticate();
      }
    }

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
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
      String email = await _localStorage.getFaceEmail();
      String password = await _localStorage.getFaceP();

      String pass = Encrypt.decryptString(password);
      login(email, pass);
    }
  }

  Future<void> login(String email, String password) async {
    _buttonEnabled = false;
    update(['loginButton']);
    mainController.showLoader(
      title: 'Iniciando sesión...',
      message: 'Por favor espere',
    );
    Either<String, Unit> authFailureOrSuccessOption =
        await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    authFailureOrSuccessOption.fold(
      (failure) {
        Get.back();
        _buttonEnabled = true;
        update(['loginButton']);
        Snackbars.error(failure);
      },
      (_) async {
        String pass = Encrypt.encryptString(password);
        await _localStorage.setFaceEmail(email);
        await _localStorage.saveFaceP(pass);

        Get.offNamedUntil(Routes.HOME, (route) => false);
      },
    );
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String email = data[Fields.email.name].toString();
    String password = data[Fields.password.name].toString();
    await login(email, password);
  }
}
