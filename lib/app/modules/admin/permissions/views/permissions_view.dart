import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/permissions_controller.dart';

class PermissionsView extends GetView<PermissionsController> {
  const PermissionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PermissionsController>(
      id: 'view',
      builder: (_) {
        return MainLayout(
          maxWidth: 900,
          mainCurrentRoute: Routes.ADMIN,
          currentRoute: Routes.PERMISSIONS,
          appBarTitle: 'Permisos de usuario',
          child: SingleChildScrollView(
            child: Container(
              child: Text(controller.listUsers.toString()),
            ),
          ),
        );
      },
    );
  }
}
