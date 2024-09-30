import 'package:get/get.dart';

import '../../data/providers/local/local_storage.dart';

class UserController extends GetxController {
  LocalStorage localStorage = Get.find();

  String? _token;
  String? get token => _token;

  void setToken(String? value) {
    _token = value;
  }

  String? _email;
  String? get email => _email;

  void setEmail(String? value) {
    _email = value;
  }

  String? _otpCode;
  String? get otpCode => _otpCode;

  void setOtpCode(String? value) {
    _otpCode = value;
  }
}
