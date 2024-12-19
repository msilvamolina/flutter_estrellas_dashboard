import 'package:get_storage/get_storage.dart';

class LocalStorage {
  final GetStorage _getStorage = GetStorage();
  static const USERKEY = "USERKEY";
  static const welcomeKey = "WELCOMEKEY";
  static const getAdminKey = "ADMINKEY";
  static const faceidEnabledkey = "FACEIDENABLEDKEY";
  static const faceidEmailkey = "faceidEmailkey";
  static const faceidPkey = "faceidPkey";

  Future<void> cleanAll() async {
    await _getStorage.remove(USERKEY);
    await _getStorage.erase();
  }

  Future<bool> getWelcome() async {
    final value = await _getStorage.read(welcomeKey) ?? false;
    return value;
  }

  Future<void> setWelcome(bool value) async {
    await _getStorage.write(welcomeKey, value);
  }

  Future<List<String>> getAdminPermissions() async {
    final value = await _getStorage.read(getAdminKey) ?? [];
    return value;
  }

  Future<void> setAdminPermissions(List<String> value) async {
    await _getStorage.write(getAdminKey, value);
  }

  Future<bool> getFaceIdEnabled() async {
    final value = await _getStorage.read(faceidEnabledkey) ?? false;
    return value;
  }

  Future<String> getFaceEmail() async {
    final value = await _getStorage.read(faceidEmailkey) ?? false;
    return value;
  }

  Future<String> getFaceP() async {
    final value = await _getStorage.read(faceidPkey) ?? false;
    return value;
  }

  Future<void> setFaceEmail(String value) async {
    await _getStorage.write(faceidEmailkey, value);
  }

  Future<void> saveFaceIdEnabled(bool value) async {
    await _getStorage.write(faceidEnabledkey, value);
  }

  Future<void> saveFaceP(String value) async {
    await _getStorage.write(faceidPkey, value);
  }
}
