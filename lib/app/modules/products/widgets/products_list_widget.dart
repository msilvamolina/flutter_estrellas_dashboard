import 'package:flutter/widgets.dart';

import '../../../data/models/product/product.dart';
import 'product_card.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({required this.list, super.key});

  final List<ProductModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ProductCard(
          product: list[index],
        );
      },
    );
  }
}
