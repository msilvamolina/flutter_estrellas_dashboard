import 'package:drag_grid/drag_grid.dart';
import 'package:estrellas_dashboard/app/components/widgets/loadingButton.dart';
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
      bottomNavigationBar: GetBuilder<ProductImagesController>(
        id: 'list_changed',
        builder: (_) {
          if (controller.listChanged)
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: LoadingButton(
                  onPressed: controller.saveNewOrder,
                  label: 'Guardar orden',
                  isLoading: false,
                ),
              ),
            );
          else
            return SizedBox.shrink();
        },
      ),
      currentRoute: Routes.PRODUCT_ADD_IMAGE,
      appBarTitle: 'Añadir imagen',
      appBarWidget: AppbarTitleWithBack(title: 'Imágenes'),
      child: Obx(
        () => controller.list.isNotEmpty
            ? DragGrid<String>(
                itemList: List.generate(controller.list.length,
                    (index) => controller.list[index].imageUrl),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 24.0),
                sliverGridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ),
                itemListChanger: controller.onListChanged,
                itemBuilder: (context, item, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                      ),
                    ),
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
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Image.network(
        image.imageUrl,
        fit: BoxFit.cover,
      ),
    ),
  );
}
