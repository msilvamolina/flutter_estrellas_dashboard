import 'package:estrellas_dashboard/app/data/models/variant_variant/variant_variant.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class VariantCard extends StatelessWidget {
  const VariantCard({required this.variant, super.key});

  final VariantVariantModel variant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          if (variant.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CircleAvatar(
                radius: 26,
                backgroundImage: NetworkImage(
                    variant.imageUrl!), // Usa la URL de variant.value
                onBackgroundImageError: (exception, stackTrace) {
                  print(
                      'Error al cargar la imagen: $exception'); // Manejo de error
                },
              ),
            )
          else ...[
            if (!variant.isColor && !variant.isImage)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CircleAvatar(
                  radius: 26,
                  child: Text(variant.value),
                  backgroundColor:
                      Colors.grey, // Color de fondo del CircleAvatar
                ),
              ),
            if (variant.isColor)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CircleAvatar(
                  radius: 26,
                  backgroundColor: Utils.getColor(variant.value),
                ),
              ),
            if (variant.isImage)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(
                      variant.value), // Usa la URL de variant.value
                  onBackgroundImageError: (exception, stackTrace) {
                    print(
                        'Error al cargar la imagen: $exception'); // Manejo de error
                  },
                ),
              ),
          ],
          Text(
            variant.name,
            style: TypographyStyle.bodyBlackMedium,
          ),
        ],
      ),
    );
  }
}
