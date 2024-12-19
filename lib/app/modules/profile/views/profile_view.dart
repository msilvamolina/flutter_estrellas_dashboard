import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mainController) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Column(
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
                                'Harry Hernandez',
                                style: TypographyStyle.h3Mobile,
                              ),
                              Text(
                                '@harryhernandez876',
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
                    SizedBox(height: 26),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.favorite),
                            title: Text(
                              'Invite friends',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.help_rounded),
                            title: Text(
                              'Help',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
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
                    const SizedBox(height: 24),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            title: Text(
                              'Account details',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            trailing: Text(
                              'See all',
                              style: TypographyStyle.bodyRegularMedium,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Name',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            trailing: Text(
                              'Personal.SGD',
                              style: TypographyStyle.bodyRegularMedium,
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Account',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.copy,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '876424432432422',
                                  style: TypographyStyle.bodyRegularMedium,
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            title: Text(
                              'Bank name',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.copy,
                                  size: 12,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'DBS Bank Ltd.',
                                  style: TypographyStyle.bodyRegularMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.diamond_rounded),
                            title: Text(
                              'Plan',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                            subtitle: Text(
                              'Gold',
                              style: TypographyStyle.bodyRegularSmall,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.person),
                            title: Text(
                              'Account',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.square_rounded),
                            title: Text(
                              'Spending Categories',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Icon(Icons.security_rounded),
                            title: Text(
                              'Security & privacy',
                              style: TypographyStyle.bodyBlackMedium,
                            ),
                          ),
                        ],
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
