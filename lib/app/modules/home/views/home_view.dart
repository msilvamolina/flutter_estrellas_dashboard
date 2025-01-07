import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/layouts/main_layout/main_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return MainLayout(
      currentRoute: Routes.HOME,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Subtítulos alineados a la izquierda
          children: [
            Text('Mi cuenta', style: TypographyStyle.h3Mobile),
            const SizedBox(height: 8.0),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildGridItem(
                  context,
                  image: 'assets/images/theme.png',
                  label: 'Cambiar\ntema',
                  onTap: () {
                    mainController.changeThemeColor();
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/darkmode.png',
                  label: 'Modo\noscuro',
                  onTap: () {
                    mainController.changeThemeMode();
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/face.png',
                  label: 'FaceID',
                  onTap: () {
                    mainController.changeFaceId();
                  },
                ),
              ],
            ),
            // Subtítulo para la primera línea
            Text('Crear', style: TypographyStyle.h3Mobile),
            const SizedBox(
                height: 8.0), // Espacio entre el subtítulo y las tarjetas
            // Primera línea de tarjetas
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 4,
              shrinkWrap:
                  true, // Permitir que el GridView se ajuste al contenido
              physics:
                  const NeverScrollableScrollPhysics(), // Desactivar scroll dentro de GridView
              children: [
                _buildGridItem(
                  context,
                  image: 'assets/images/add-contact.png',
                  label: 'Crear\nProveedor',
                  onTap: () {
                    Get.toNamed(Routes.CREATE_PROVIDER);
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/product-design.png',
                  label: 'Crear\nProducto',
                  onTap: () {
                    Get.toNamed(Routes.CREATE_PRODUCT);
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/upload-video.png',
                  label: 'Crear\nVideo',
                  onTap: () {
                    Get.toNamed(Routes.CREATE_VIDEO);
                  },
                ),
              ],
            ),
            const SizedBox(height: 8), // Espacio entre líneas de tarjetas
            Text('Detalles', style: TypographyStyle.h3Mobile),
            const SizedBox(height: 8.0),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 3 / 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildGridItem(
                  context,
                  image: 'assets/images/teamwork.png',
                  label: 'Proveedores',
                  onTap: () {
                    Get.toNamed(Routes.PROVIDERS_LIST);
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/productss.png',
                  label: 'Productos',
                  onTap: () {
                    Get.toNamed(Routes.PRODUCTS);
                  },
                ),
                _buildGridItem(
                  context,
                  image: 'assets/images/videocall.png',
                  label: 'Videos',
                  onTap: () {
                    Get.toNamed(Routes.VIDEOS_LIST);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildGridItem(BuildContext context,
    {required String image,
    required String label,
    required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, width: 60, height: 60),
            const SizedBox(height: 8.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TypographyStyle.bodyBlackLarge,
            ),
          ],
        ),
      ),
    ),
  );
}
