import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../data/models/product/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(product.toString()),
        ),
      ),
    );
  }
}
