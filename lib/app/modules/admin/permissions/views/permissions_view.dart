import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/permissions_controller.dart';
import '../widgets/user_admin_card.dart';

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
          child: !controller.loading
              ? ListView.builder(
                  itemCount: controller.listUsers.length,
                  itemBuilder: (context, index) {
                    return UserAdminCard(
                      user: controller.listUsers[index],
                    );
                  },
                )
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
