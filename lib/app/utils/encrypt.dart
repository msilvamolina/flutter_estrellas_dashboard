import 'dart:convert';

import 'package:encrypt/encrypt.dart';

// ignore: avoid_classes_with_only_static_members
class Encrypt {
  static Key key = Key.fromUtf8('my32length3q4hjsec978798asdihw24');

  static Encrypter getEncrypter() {
    Key b64key = Key.fromBase64(base64Url.encode(key.bytes));
    Fernet fernet = Fernet(b64key);
    return Encrypter(fernet);
  }

  static String encryptString(String text) =>
      getEncrypter().encrypt(text).base64;
  static String decryptString(String text) => getEncrypter().decrypt64(text);
}
