import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/layouts/main_layout/main_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: Routes.HOME,
      child: GridView.count(
        crossAxisCount: 2, // Dos columnas
        crossAxisSpacing: 8.0, // Espacio horizontal entre columnas
        mainAxisSpacing: 8.0, // Espacio vertical entre filas
        children: [
          _buildGridItem(
            context,
            image: 'assets/images/product-design.png',
            label: 'Crear Producto',
            onTap: () {
              Get.toNamed(Routes.CREATE_PRODUCT);
            },
          ),
          _buildGridItem(
            context,
            image: 'assets/images/add-contact.png',
            label: 'Crear Proveedor',
            onTap: () {
              Get.toNamed(Routes.CREATE_PROVIDER);
            },
          ),
          _buildGridItem(
            context,
            image: 'assets/images/upload-video.png',
            label: 'Subir Video',
            onTap: () {
              Get.toNamed(Routes.CREATE_VIDEO);
            },
          ),
          _buildGridItem(
            context,
            image: 'assets/images/video.png',
            label: 'Videos',
            onTap: () {
              Get.toNamed(Routes.VIDEOS_LIST);
            },
          ),
        ],
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
        borderRadius:
            BorderRadius.circular(8.0), // Bordes redondeados de 8 píxeles
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 80),
          SizedBox(height: 16.0), // Espacio entre el ícono y el texto
          Text(label, style: TypographyStyle.bodyBlackLarge),
        ],
      ),
    ),
  );
}
