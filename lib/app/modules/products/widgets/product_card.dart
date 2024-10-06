import 'package:flutter/material.dart';

import '../../../data/models/product/product/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(product.toString()),
      ),
    );
  }
}
