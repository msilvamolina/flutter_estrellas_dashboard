import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_images_controller.dart';

class ProductImagesView extends GetView<ProductImagesController> {
  const ProductImagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: () => Get.toNamed(
          Routes.PRODUCT_ADD_IMAGE,
          arguments: controller.product,
        ),
      ),
      showMenu: false,
      currentRoute: Routes.PRODUCT_ADD_IMAGE,
      appBarTitle: 'Añadir imagen',
      appBarWidget: AppbarTitleWithBack(title: controller.product.name),
      child: GetBuilder<ProductImagesController>(
        id: 'view',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          );
        },
      ),
    );
  }
}
