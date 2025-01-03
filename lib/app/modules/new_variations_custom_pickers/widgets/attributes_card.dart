import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../data/models/variant_variant/variant_variant.dart';
import '../controllers/new_variations_custom_pickers_controller.dart';
import 'variant_card.dart';

class AttributesCard extends StatelessWidget {
  const AttributesCard({required this.attribute, super.key});

  final VariantAttributeModel attribute;
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.surface;
    Color primarySelected = Theme.of(context).colorScheme.surfaceBright;
    return GetBuilder<NewVariationsCustomPickersController>(
      id: 'view',
      builder: (controller) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      attribute.name,
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () => controller.saveVariant(attribute),
                    ),
                  ],
                ),
                Obx(
                  () => Wrap(
                    children: [
                      for (VariantVariantModel variant
                          in controller.getVariations(attribute))
                        GestureDetector(
                          onTap: () => controller.onVariantPressed(variant),
                          child: Stack(
                            children: [
                              Card(
                                color: controller.isVariantChecked(variant)
                                    ? primarySelected
                                    : primary,
                                child: VariantCard(variant: variant),
                              ),
                              if (controller.isVariantChecked(variant))
                                SvgPicture.asset(
                                  'assets/svg/check.svg',
                                  width: 28,
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
