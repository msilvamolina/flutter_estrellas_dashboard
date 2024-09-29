import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../themes/styles/typography.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    required this.isMobile,
    required this.currentRoute,
    this.mainCurrentRoute,
    super.key,
  });

  final bool isMobile;
  final String currentRoute;
  final String? mainCurrentRoute;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (isMobile)
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/svg/fulllogo.svg',
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
                Spacer(),
                Text('martin@gmail.com'),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: mainController.changeThemeColor,
                  leading: Icon(Icons.color_lens),
                  title: Text('Cambiar tema'),
                  // selected: true,
                ),
              ],
            ),
          ),
        menuOption(
          title: 'Home',
          route: Routes.HOME,
        ),
        menuOption(
          title: 'Productos',
          route: Routes.PRODUCTS,
        ),
        ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          initiallyExpanded: mainCurrentRoute == Routes.TEST_ENDPOINTS,
          expandedAlignment: Alignment.centerLeft,
          title: const Text('Test Endpoints'),
          children: [
            menuOptionChildren(
              icon: Icons.http,
              title: 'Get products',
              route: Routes.TEST_GET_PRODUCTS,
            ),
          ],
        ),
        SizedBox(height: 400),
        ListTile(
          title: const Text('Salir'),
          onTap: mainController.signOut,
        ),
      ],
    );
  }

  Widget menuOption({required String title, required String route}) => ListTile(
        title: Text(title),
        onTap: currentRoute != route ? () => Get.offNamed(route) : null,
        selected: currentRoute == route,
      );

  Widget menuOptionChildren({
    required String title,
    required String route,
    IconData? icon,
  }) =>
      ListTile(
        leading: icon != null ? Icon(icon) : null,
        title: Text(
          title,
          style: TypographyStyle.bodyRegularMedium,
        ),
        onTap: currentRoute != route ? () => Get.offNamed(route) : null,
        selected: currentRoute == route,
      );
}
