import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/models/variant_variant/variant_variant.dart';
import '../../new_variations_custom_pickers/widgets/variant_card.dart';
import '../controllers/new_variations_controller.dart';

class VariationsCard extends StatelessWidget {
  const VariationsCard(
      {required this.variation, required this.controller, super.key});

  final ProductVariantModel variation;
  final NewVariationsController controller;
  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.surface;

    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Wrap(
                  children: [
                    ...variation.values.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final value = entry.value;
                        final isLast = index == variation.values.length - 1;
                        String name = value['value'];
                        return Text(
                          isLast ? name : '$name - ',
                          style: TypographyStyle.bodyBlackLarge,
                        );
                      },
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () => controller.editVariation(variation),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            Row(
              children: [
                ...variation.values.map(
                  (value) {
                    VariantVariantModel? variant =
                        controller.getVariationWithName(value['value']);
                    if (variant != null) {
                      return Card(
                        color: primary,
                        child: VariantCard(variant: variant),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
