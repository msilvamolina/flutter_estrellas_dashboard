import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/services/user_permissions.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminScaffold extends StatelessWidget {
  const AdminScaffold({
    required this.permission,
    required this.child,
    super.key,
  });

  final Permissions permission;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();

    if (mainController.checkUserPermission(permission)) {
      return child;
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/restriction2.png',
            width: 160,
          ),
          SizedBox(height: 16),
          Text(
            'Usted no tiene permisos\npara hacer realizar esta acción',
            style: TypographyStyle.bodyBlackLarge,
            textAlign: TextAlign.center,
          ),
        ],
      );
    }
  }
}
