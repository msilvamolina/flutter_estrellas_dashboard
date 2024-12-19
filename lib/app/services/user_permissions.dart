import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:get/get.dart';

enum Permissions {
  godMode,
  superAdmin,
  createProduct,
  editProduct,
  createVideo,
  editVideo,
  createWarehouse,
  editWarehouse,
  createProvider,
  editProdiver,
  createUser,
  setUserPermission,
}

Future<bool> checkUserPermission(Permissions name) async {
  LocalStorage localStorage = Get.find<LocalStorage>();
  String _permission = name.toString().split('.').elementAt(1);
  List<String> _list = await localStorage.getAdminPermissions();
  for (int i = 0; i < _list.length; i++) {
    if (_list[i] == 'godMode') {
      return true;
    }
    if (_permission == _list[i]) {
      return true;
    }
  }
  return false;
}

Future<bool> checkGodMode() async {
  LocalStorage localStorage = Get.find<LocalStorage>();

  List<String> _list = await localStorage.getAdminPermissions();
  for (int i = 0; i < _list.length; i++) {
    if (_list[i] == 'godMode') {
      return true;
    }
  }
  return false;
}
