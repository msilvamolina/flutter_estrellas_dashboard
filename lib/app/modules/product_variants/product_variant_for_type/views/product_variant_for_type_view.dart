import 'package:cached_network_image/cached_network_image.dart';
import 'package:drag_grid/drag_grid.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_variant_for_type_controller.dart';

class ProductVariantForTypeView
    extends GetView<ProductVariantForTypeController> {
  const ProductVariantForTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: controller.addVariant,
      ),
      appBar: AppBar(title: Text(controller.typeSelected.name.toString())),
      bottomNavigationBar: GetBuilder<ProductVariantForTypeController>(
        id: 'list_changed',
        builder: (_) {
          if (controller.listChanged)
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  height: 42,
                  child: LoadingButton(
                    onPressed: controller.saveNewOrder,
                    label: 'Guardar orden',
                    isLoading: controller.buttonSaveLoading,
                  ),
                ),
              ),
            );
          else
            return SizedBox.shrink();
        },
      ),
      body: Obx(
        () => controller.list.isNotEmpty
            ? DragGrid<String>(
                itemList:
                    List.generate(controller.list.length, (index) => '$index'),
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
                  return cardItem(
                    controller.list[int.parse(item)],
                    controller.typeSelected.name,
                  );
                },
              )
            : const Text('no data'),
      ),
    );
  }
}

Widget cardItem(ProductVariantModel item, String type) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CachedNetworkImage(
            width: 90,
            imageUrl: item.imageUrl ?? '',
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/variants/$type.png'),
          ),
          Spacer(),
          Text(
            item.label,
            style: TypographyStyle.bodyRegularMedium,
          ),
          Text(
            item.name,
            style: TypographyStyle.bodyBlackLarge,
          ),
        ],
      ),
    ),
  );
}
