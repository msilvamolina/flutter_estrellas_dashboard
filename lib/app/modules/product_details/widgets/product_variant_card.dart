import 'package:estrellas_dashboard/app/data/models/variant_variant/variant_variant.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import '../../../themes/styles/colors.dart';
import '../../../utils/utils.dart';

class ProductVariantCard extends StatelessWidget {
  const ProductVariantCard({required this.variant, super.key});

  final VariantVariantModel variant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          if (variant.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(variant.imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          else ...[
            if (!variant.isColor && !variant.isImage)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: neutral400,
                  ),
                  width: 52,
                  height: 52,
                  child: Center(
                    child: Text(
                      variant.value,
                      style: TypographyStyle.bodyBlackLarge2.copyWith(
                        fontWeight: FontWeight.w600,
                        color: neutral950,
                      ),
                    ),
                  ),
                ),
              ),
            if (variant.isColor)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Utils.getColor(variant.value),
                    ),
                    width: 52,
                    height: 52,
                    child: SizedBox.shrink()),
              ),
            if (variant.isImage)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(variant.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
          ],
        ],
      ),
    );
  }
}
