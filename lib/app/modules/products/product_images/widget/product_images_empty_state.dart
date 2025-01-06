import 'package:flutter/material.dart';

import '../../../../themes/styles/typography.dart';

class ProductImagesEmptyState extends StatelessWidget {
  const ProductImagesEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/picture.png',
              width: 140,
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(
                'Este producto no tiene imágenes adicionales',
                style: TypographyStyle.bodyBlackLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
