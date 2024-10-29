import 'package:cached_network_image/cached_network_image.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../../utils/money_amount.dart';

class CombinationCard extends StatelessWidget {
  const CombinationCard({required this.combinationElement, super.key});

  final ProductVariantCombinationModel combinationElement;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            cardVariable('id', combinationElement.id, context),
            cardVariable('dropiId', combinationElement.dropiId ?? '', context),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: CachedNetworkImage(
                    width: 90,
                    imageUrl: combinationElement.imageUrl ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/variants/combinations.png'),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      cardVariable('name', combinationElement.name, context),
                      cardVariable('label', combinationElement.label, context),
                      cardVariable(
                          'price',
                          MoneyAmount.convertMoneyString(
                              combinationElement.price ?? 0),
                          context),
                      cardVariable(
                          'suggestedPrice',
                          MoneyAmount.convertMoneyString(
                              combinationElement.suggestedPrice ?? 0),
                          context),
                      cardVariable(
                          'points',
                          (combinationElement.points ?? '').toString(),
                          context),
                      cardVariable('stock',
                          (combinationElement.stock ?? '').toString(), context),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget cardVariable(String label, String element, context) {
    Color primary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TypographyStyle.bodyBlackMedium.copyWith(color: primary),
          ),
          Text(element),
        ],
      ),
    );
  }
}
