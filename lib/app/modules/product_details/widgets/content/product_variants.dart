import 'package:flutter/material.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';
import '../variants/product_variants_color.dart';
import '../variants/product_variants_size.dart';

class ProductVariants extends StatelessWidget {
  const ProductVariants({required this.listVariants, super.key});

  final List<ProductVariantModel> listVariants;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductVariantsSize(
            listVariants:
                listVariants.where((item) => item.type == "size").toList()),
        SizedBox(height: 16),
        ProductVariantsColor(
            listVariants:
                listVariants.where((item) => item.type == "color").toList()),
      ],
    );
  }
}
