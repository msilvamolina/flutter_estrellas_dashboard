import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/services/user_permissions.dart';
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
                Text(mainController.userData?.email ?? ''),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => Get.toNamed(Routes.PROFILE),
                  leading: Icon(Icons.verified_user),
                  title: Text('Mi cuenta'),
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
          title: 'Videos',
          route: Routes.VIDEOS_LIST,
          backRoute: Routes.CREATE_VIDEO,
        ),
        menuOption(
          title: 'Proveedores',
          route: Routes.PROVIDERS_LIST,
          backRoute: Routes.PROVIDERS_LIST,
        ),
        menuOption(
          title: 'Productos',
          route: Routes.PRODUCTS,
          backRoute: Routes.PRODUCT_ESTRELLAS_1,
        ),
        if (mainController.checkUserPermission(Permissions.superAdmin))
          menuOptionExpansion(
            title: 'Test Endpoints',
            route: Routes.TEST_ENDPOINTS,
            children: [
              menuOptionChildren(
                icon: Icons.http,
                title: 'Login App Dropi',
                route: Routes.TEST_LOGIN_APP_DROPI,
              ),
              menuOptionChildren(
                icon: Icons.http,
                title: 'Get products',
                route: Routes.TEST_GET_PRODUCTS,
              ),
            ],
          ),
        if (mainController.checkUserPermission(Permissions.superAdmin))
          menuOptionExpansion(
            title: 'Admin',
            route: Routes.ADMIN,
            children: [
              menuOptionChildren(
                icon: Icons.verified_user_sharp,
                title: 'Permisos de usuario',
                route: Routes.PERMISSIONS,
              ),
              menuOptionChildren(
                icon: Icons.http,
                title: 'Copiar Departamentos desde DROPI',
                route: Routes.COPY_DEPARTMENTS,
              ),
            ],
          ),
        Divider(),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: const Text('Salir'),
          onTap: mainController.signOut,
        ),
      ],
    );
  }

  Widget menuOptionExpansion({
    required String title,
    required String route,
    required List<Widget> children,
  }) =>
      ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        initiallyExpanded: mainCurrentRoute == route,
        expandedAlignment: Alignment.centerLeft,
        title: Text(title),
        children: children,
      );

  void getBack() {
    if (isMobile) {
      Get.back();
      Get.back();
    } else {
      Get.back();
    }
  }

  Widget menuOption(
          {required String title, required String route, String? backRoute}) =>
      ListTile(
        title: Text(title),
        onTap: currentRoute != route
            ? () => backRoute == currentRoute ? getBack() : Get.offNamed(route)
            : null,
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
