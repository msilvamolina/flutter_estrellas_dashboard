import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/theme_model.dart';
import 'package:estrellas_dashboard/app/themes/themes.dart';

class ChangeColorDialog extends StatelessWidget {
  const ChangeColorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      child: AlertDialog(
        title: Text('Personaliza tu app'),
        content: Container(
          constraints: BoxConstraints(maxWidth: 450),
          child: Wrap(
            children: [
              for (int i = 0; i < ListThemes.list.length; i++) ...[
                colorAvatar(ListThemes.list[i])
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget colorAvatar(ThemeModel theme) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: InkWell(
        onTap: () {
          Get.find<MainController>().onChangeColorTheme(theme);
          Future.delayed(Duration(milliseconds: 200), () {
            Get.back();
          });
        },
        child: CircleAvatar(
          radius: 24,
          backgroundColor: theme.color,
        ),
      ),
    );
  }
}
