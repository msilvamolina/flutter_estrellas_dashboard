import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../themes/styles/typography.dart';
import '../../new_variations_custom_pickers/widgets/attributes_card.dart';
import '../../new_variations_custom_pickers/widgets/empty_state.dart';
import '../../new_variations_custom_pickers/widgets/variant_card.dart';
import '../controllers/new_variations_controller.dart';

class ProductVariantsTab extends StatelessWidget {
  const ProductVariantsTab({required this.controller, super.key});

  final NewVariationsController controller;
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.surface;

    return GetBuilder<NewVariationsController>(
      id: 'view',
      builder: (_) {
        if (!controller.isLoading.value) {
          return ListView.separated(
            itemCount: controller.variantInfoModel!.attributes!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.variantInfoModel!.attributes![index].name,
                          style: TypographyStyle.bodyBlackLarge,
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          children: [
                            for (VariantVariantModel variant
                                in controller.getVariations(controller
                                    .variantInfoModel!.attributes![index]))
                              Card(
                                color: primary,
                                child: VariantCard(variant: variant),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox.shrink(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
