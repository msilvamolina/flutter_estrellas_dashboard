import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    required this.isMobile,
    super.key,
  });

  final bool isMobile;
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
        ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
