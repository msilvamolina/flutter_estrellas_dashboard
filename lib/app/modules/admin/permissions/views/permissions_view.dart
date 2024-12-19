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
          appBarWidget: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controller.textEditingController,
              onChanged: controller.filterUsers, // Filtro en tiempo real
              decoration: InputDecoration(
                hintText: 'Buscar por uid, email o permisos...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: controller.resetFilter, // Reinicia el filtro
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
              ),
            ),
          ),
          child: !controller.loading
              ? ListView.builder(
                  itemCount: controller.filteredUsers.length,
                  itemBuilder: (context, index) {
                    return UserAdminCard(
                      user: controller.filteredUsers[index],
                    );
                  },
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
