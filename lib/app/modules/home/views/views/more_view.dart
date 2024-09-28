import 'package:flutter/material.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:get/get.dart';

import '../../../../services/theme_service.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (mainController) {
        return SafeArea(
          child: Column(
            children: [
              SizedBox(height: 16),
              if (mainController.userStatus == UserStatus.full)
                ElevatedButton(
                  onPressed: mainController.signOut,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .secondaryContainer, // Color secundario
                  ),
                  child: Text('Cerrar sesión'),
                ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: mainController.changeThemeMode,
                style: ElevatedButton.styleFrom(),
                child: Text('Cambiar tema'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: mainController.changeThemeColor,
                style: ElevatedButton.styleFrom(),
                child: Text('Cambiar color'),
              ),
            ],
          ),
        );
      },
    );
  }
}
