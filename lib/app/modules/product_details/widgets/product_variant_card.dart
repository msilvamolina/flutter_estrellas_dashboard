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
                  constraints: BoxConstraints(
                    minWidth: 52,
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(8), // Esquinas redondeadas
                    border: Border.all(
                      color: neutral400, // Color del borde
                      width: 1, // Ancho del borde
                    ),
                    color: Colors.white, // Fondo blanco
                  ),
                  height: 52,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          variant.value,
                          style: TypographyStyle.bodyBlackMedium.copyWith(
                            color: neutral700,
                          ),
                        ),
                      ],
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
