import 'dart:collection';

import 'package:estrellas_dashboard/app/data/models/admin_user/admin_user_model.dart';
import 'package:get/get.dart';

import '../../../../services/user_permissions.dart';

class SetPermissionsController extends GetxController {
  late AdminUserModel user;

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
    // _popupService.showPopup(popup: triiLoader, context: Amz.context());
    // Either<String, Unit> result =
    //     await _services.setUserClaims(user.uid, _mapPermissions);
    // _popupService.closePopup();
    // Future<void>.delayed(Duration(milliseconds: 100), () {
    //   result.fold(
    //     Amz.errorToast,
    //     (_) => Amz.errorToast(
    //       'Los permisos se guardaron correctamente',
    //     ),
    //   );
    // });
  }
}
