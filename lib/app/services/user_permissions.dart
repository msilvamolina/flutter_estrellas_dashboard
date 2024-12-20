import 'package:estrellas_dashboard/app/data/providers/local/local_storage.dart';
import 'package:flutter/material.dart';
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
  editProvider,
  createUser,
  setUserPermission,
}

final Map<Permissions, IconData> permissionIcons = {
  Permissions.godMode: Icons.star,
  Permissions.superAdmin: Icons.shield,
  Permissions.createProduct: Icons.add_circle,
  Permissions.editProduct: Icons.edit,
  Permissions.createVideo: Icons.video_call,
  Permissions.editVideo: Icons.edit_attributes,
  Permissions.createWarehouse: Icons.warehouse,
  Permissions.editWarehouse: Icons.edit_location,
  Permissions.createProvider: Icons.person_add,
  Permissions.editProvider: Icons.person_pin,
  Permissions.createUser: Icons.person_add_alt_1,
  Permissions.setUserPermission: Icons.security,
};

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
