import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/widgets/loadingButton.dart';
import '../controllers/set_permissions_controller.dart';

class SetPermissionsView extends GetView<SetPermissionsController> {
  const SetPermissionsView({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primaryFixed;
    return GetBuilder<SetPermissionsController>(
      id: 'view',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              controller.user.email ?? controller.user.uid,
              style: TypographyStyle.bodyBlackLarge,
            ),
            centerTitle: true,
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                height: 42,
                child: LoadingButton(
                  onPressed: controller.savePermissions,
                  label: 'Guardar permisos',
                  isLoading: controller.buttonSaveLoading,
                ),
              ),
            ),
          ),
          body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: controller.listPermissions.length,
            itemBuilder: (BuildContext context, int index) => Container(
              child: SwitchListTile(
                activeColor: primaryColor,
                title: Text(controller.listPermissions[index]),
                value: controller
                    .getPermissionInfo(controller.listPermissions[index]),
                onChanged: (_) => controller
                    .changePermission(controller.listPermissions[index]),
              ),
            ),
          ),
        );
      },
    );
  }
}
