import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slideable/slideable.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../data/models/product_image/product_image_model.dart';
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
      appBarWidget: AppbarTitleWithBack(title: 'Imágenes'),
      child: Obx(
        () => controller.list.isNotEmpty
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0,
                ),
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return _listItem(
                    context: context,
                    image: controller.list[index],
                    index: index,
                    resetSlide: false,
                  );
                },
              )
            : const Text('no data'),
      ),
    );
  }
}

Widget _listItem({
  required BuildContext context,
  required ProductImageModel image,
  required int index,
  required bool resetSlide,
}) {
  return Card(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.network(
          image.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
