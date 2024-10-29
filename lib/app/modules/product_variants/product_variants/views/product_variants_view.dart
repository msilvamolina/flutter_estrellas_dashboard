import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slideable/slideable.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/styles/typography.dart';
import '../../product_variant_for_type/controllers/product_variant_for_type_controller.dart';
import '../controllers/product_variants_controller.dart';

class ProductVariantsView extends GetView<ProductVariantsController> {
  const ProductVariantsView({super.key});
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;

    return MainLayout(
      // floatingActionButton: CustomFloatingActionButton(
      //   label: 'Agregar',
      //   icon: Icons.add,
      //   onPressed: () => Get.toNamed(
      //     Routes.PRODUCT_ADD_VARIANT,
      //     arguments: controller.product,
      //   ),
      // ),
      showMenu: false,
      currentRoute: Routes.PRODUCT_VARIANTS,
      appBarTitle: 'Variaciones',
      appBarWidget: AppbarTitleWithBack(title: 'Variaciones'),
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.PRODUCT_VARIANT_FOR_TYPE,
                  arguments: VariantsTypes.size),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/size-guide.png',
                      width: 80,
                    ),
                    const SizedBox(width: 12),
                    // Elimina el Padding alrededor del Expanded
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Tallas',
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: primary),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: primary,
                      size: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(Routes.PRODUCT_VARIANT_FOR_TYPE,
                  arguments: VariantsTypes.color),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/color-palette.png',
                      width: 80,
                    ),
                    const SizedBox(width: 12),
                    // Elimina el Padding alrededor del Expanded
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Colores',
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: primary),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: primary,
                      size: 48,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
        // child: Obx(
        //   () => controller.list.isNotEmpty
        //       ? ListView.separated(
        //           itemCount: controller.list.length,
        //           itemBuilder: (context, index) {
        //             return GestureDetector(
        //               onLongPressDown: (val) {},
        //               child: _listItem(
        //                 context: context,
        //                 variant: controller.list[index],
        //                 index: index,
        //                 resetSlide: false,
        //                 // Reverse engineering the notion, meaning the Slidable widget will close all slid item, except one with false, i.e the currently slide item
        //               ),
        //             );
        //           },
        //           separatorBuilder: (context, index) =>
        //               const SizedBox(height: 10),
        //         )
        //       : const Text('no data'),
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
    child: Card(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
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
    ),
  );
}
