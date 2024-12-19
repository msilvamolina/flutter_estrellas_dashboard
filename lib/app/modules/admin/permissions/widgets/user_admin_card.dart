import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/admin_user/admin_user_model.dart';
import '../../../../routes/app_pages.dart';

class UserAdminCard extends StatelessWidget {
  const UserAdminCard({required this.user, super.key});

  final AdminUserModel user;
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).colorScheme.primaryFixed;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.SET_PERMISSIONS, arguments: user),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.uid,
                  style: TypographyStyle.bodyBlackLarge
                      .copyWith(color: primaryColor),
                ),
                Text(user.email ?? 'anonymus'),
                Text(user.claims.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
