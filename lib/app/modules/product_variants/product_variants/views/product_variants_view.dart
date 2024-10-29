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
      showMenu: false,
      currentRoute: Routes.PRODUCT_VARIANTS,
      appBarTitle: 'Variaciones',
      appBarWidget: AppbarTitleWithBack(title: 'Variaciones'),
      child: Column(
        children: [
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.PRODUCT_VARIANT_COMBINATIONS,
                arguments: [controller.product],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/variants/combinations.png',
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
                            'Combinaciones',
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
          Spacer(),
          Card(
            child: InkWell(
              onTap: () => Get.toNamed(
                Routes.PRODUCT_VARIANT_FOR_TYPE,
                arguments: [controller.product, VariantsTypes.size],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/variants/size.png',
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
              onTap: () => Get.toNamed(
                Routes.PRODUCT_VARIANT_FOR_TYPE,
                arguments: [controller.product, VariantsTypes.color],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/variants/color.png',
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
          const SizedBox(height: 36),
        ],
      ),
    );
  }
}
