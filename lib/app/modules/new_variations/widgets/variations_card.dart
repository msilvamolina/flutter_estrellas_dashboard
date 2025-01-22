import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:estrellas_dashboard/app/utils/money_amount.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        ...variation.values.asMap().entries.map(
                          (entry) {
                            final index = entry.key;
                            final value = entry.value;
                            final isLast = index == variation.values.length - 1;
                            String name = value['value'];
                            return SelectableText(
                              isLast ? name : '$name - ',
                              style: TypographyStyle.bodyBlackLarge,
                            );
                          },
                        ),
                      ],
                    ),
                    SelectableText(
                      variation.id,
                      style: TypographyStyle.bodyRegularMedium,
                    ),
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: () => controller.changeDefaultVariant(variation),
                  icon: Icon(Icons.crisis_alert),
                ),
                IconButton(
                  onPressed: () => controller.editVariation(variation),
                  icon: Icon(Icons.edit),
                ),
              ],
            ),
            SizedBox(height: 8),
            Obx(
              () => controller.defaultVariantID.value == variation.id
                  ? Container(
                      padding: EdgeInsets.all(6),
                      color: Colors.amber,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Icon(
                            Icons.cyclone_rounded,
                            color: Colors.black,
                          ),
                          Text(
                            'Esta es la variación por defecto',
                            style: TypographyStyle.bodyBlackLarge
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            SizedBox(height: 8),
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
            SizedBox(height: 16),
            Wrap(
              children: [
                priceCard(
                  context: context,
                  title: 'Precio',
                  subtitle:
                      MoneyAmount.convertMoneyString(variation.sale_price),
                ),
                priceCard(
                  context: context,
                  title: 'Precio Sugerido',
                  subtitle:
                      MoneyAmount.convertMoneyString(variation.suggested_price),
                ),
                priceCard(
                  context: context,
                  title: 'Puntos',
                  subtitle: variation.points.toString(),
                ),
                priceCard(
                  context: context,
                  title: 'Stock',
                  subtitle: variation.stock.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget priceCard({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) =>
      Padding(
        padding: const EdgeInsets.only(right: 16, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableText(
              title,
              style: TypographyStyle.bodyBlackSmall
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            SelectableText(
              subtitle,
              style: TypographyStyle.bodyRegularMedium,
            ),
          ],
        ),
      );
}
