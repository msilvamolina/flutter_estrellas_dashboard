import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../services/user_permissions.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mainController) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 2),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hola Admin!',
                                style: TypographyStyle.h3Mobile,
                              ),
                              Text(
                                '@martin',
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.purple,
                          child: Image.network(
                              'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          GetBuilder<MainController>(
                            id: 'changeFaceId',
                            builder: (_) {
                              return SwitchListTile(
                                onChanged: (_) => mainController.changeFaceId(),
                                title: Text(
                                  'Habilitar Face ID',
                                  style: TypographyStyle.bodyBlackMedium,
                                ),
                                value: mainController.isFaceIdEnabled,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          SwitchListTile(
                            onChanged: (_) => mainController.changeThemeMode(),
                            title: Text(
                              'Tema oscuro',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            value: mainController.isThemeModeDark,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: mainController.changeThemeColor,
                            title: Text(
                              'Cambiar de tema',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            trailing: Text(
                              'Cambiar',
                              style: TypographyStyle.bodyRegularMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    Text(
                      'Permisos que tienes:', // Convierte el nombre del enum en texto
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                    const SizedBox(height: 8),
                    Card(
                      child: Column(
                        children: Permissions.values.map((permission) {
                          return SwitchListTile(
                            value:
                                mainController.checkUserPermission(permission),
                            onChanged: (_) {},
                            title: Row(
                              children: [
                                Icon(permissionIcons[permission] ?? Icons.help),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  permission
                                      .name, // Convierte el nombre del enum en texto
                                  style: TypographyStyle.bodyBlackMedium,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: mainController.signOut,
                            leading: Icon(Icons.logout_rounded),
                            title: Text(
                              'Salir',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
