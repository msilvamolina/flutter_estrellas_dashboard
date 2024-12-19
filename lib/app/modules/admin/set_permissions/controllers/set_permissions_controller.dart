import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/admin_user/admin_user_model.dart';
import 'package:get/get.dart';

import '../../../../services/firebase_functions_services.dart';
import '../../../../services/user_permissions.dart';

class SetPermissionsController extends GetxController {
  late AdminUserModel user;
  final FirebaseFunctionsService _services = FirebaseFunctionsService();

  final List<String> _listPermissions = <String>[];
  List<String> get listPermissions => _listPermissions;

  bool _buttonSaveLoading = false;
  bool get buttonSaveLoading => _buttonSaveLoading;

  final Map<String, bool> _mapPermissions = HashMap<String, bool>();
  @override
  void onInit() {
    user = Get.arguments as AdminUserModel;
    Permissions.values.forEach((Permissions name) async {
      String _permission = name.toString().split('.').elementAt(1);
      _listPermissions.add(_permission);
      _mapPermissions[_permission] = checkPermission(_permission);
    });
    super.onInit();
  }

  bool checkPermission(String permission) {
    if (user.claims != null) {
      if (user.claims[permission] != null) {
        return user.claims[permission];
      }
    }
    return false;
  }

  bool getPermissionInfo(String _p) => _mapPermissions[_p] ?? false;

  void changePermission(String _p) {
    _mapPermissions[_p] = !_mapPermissions[_p]!;
    update(['view']);
  }

  Future<void> saveNewOrder() async {
    _buttonSaveLoading = true;
    update(['view']);
    Either<String, Unit> response =
        await _services.setUserClaims(user.uid, _mapPermissions);

    _buttonSaveLoading = false;
    update(['view']);
    Future<void>.delayed(Duration(milliseconds: 100), () {
      response.fold((failure) {
        Get.snackbar('Error', failure);
      }, (provider) async {
        Get.back();
        Get.snackbar('Success!', "Los permisos se guardaron correctamente");
      });
    });
  }
}
