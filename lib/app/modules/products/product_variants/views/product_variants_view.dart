import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slideable/slideable.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_variants_controller.dart';

class ProductVariantsView extends GetView<ProductVariantsController> {
  const ProductVariantsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: () => Get.toNamed(
          Routes.PRODUCT_VARIANTS,
          arguments: controller.product,
        ),
      ),
      showMenu: false,
      currentRoute: Routes.PRODUCT_ADD_IMAGE,
      appBarTitle: 'Variaciones',
      appBarWidget: AppbarTitleWithBack(title: 'Variaciones'),
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
                    variant: controller.list[index],
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

Slideable _listItem({
  required BuildContext context,
  required ProductVariantModel variant,
  required int index,
  required bool resetSlide,
}) {
  return Slideable(
    resetSlide: resetSlide,
    items: <ActionItems>[
      ActionItems(
        icon: const Icon(
          Icons.thumb_up,
          color: Colors.blue,
        ),
        onPress: () {},
        backgroudColor: Colors.transparent,
      ),
      ActionItems(
        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPress: () {},
        backgroudColor: Colors.transparent,
      ),
    ],
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 214, 214, 214),
        border: Border.all(
          width: 1,
          color: const Color.fromARGB(124, 158, 158, 158),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: Colors.white,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: SizedBox.shrink(),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Name",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  variant.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "#${index + 1}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
