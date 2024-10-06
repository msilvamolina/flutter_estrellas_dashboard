import 'package:flutter/widgets.dart';

import '../../../data/models/product/product/product.dart';
import 'product_card.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({required this.list, super.key});

  final List<ProductModel> list;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(
              top: index == 0 ? 8 : 0,
              bottom: index == (list.length - 1) ? 48 : 0),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: ProductCard(
              product: list[index],
            ),
          ),
        );
      },
    );
  }
}
