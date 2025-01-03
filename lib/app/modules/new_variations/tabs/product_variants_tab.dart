import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/variant_variant/variant_variant.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../../new_variations_custom_pickers/widgets/attributes_card.dart';
import '../../new_variations_custom_pickers/widgets/empty_state.dart';
import '../../new_variations_custom_pickers/widgets/variant_card.dart';
import '../controllers/new_variations_controller.dart';
import '../widgets/variant_empty_state.dart';

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
          if (controller.variantInfoModel != null) {
            return ListView.separated(
              itemCount: controller.variantInfoModel!.attributes!.length,
              itemBuilder: (context, index) {
                List<VariantVariantModel> list = controller.getVariations(
                    controller.variantInfoModel!.attributes![index]);
                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller
                                .variantInfoModel!.attributes![index].name,
                            style: TypographyStyle.bodyBlackLarge,
                          ),
                          SizedBox(height: 8),
                          Wrap(
                            children: [
                              for (int index2 = 0;
                                  index2 < list.length;
                                  index2++)
                                GestureDetector(
                                  onTap: () =>
                                      controller.onCardPressed(list[index2]),
                                  child: Card(
                                    color: primary,
                                    child: VariantCard(variant: list[index2]),
                                  ),
                                )
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
            return VariantEmptyState();
          }
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
