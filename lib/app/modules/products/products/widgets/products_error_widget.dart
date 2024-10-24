import 'package:flutter/widgets.dart';

class ProductsErrorWidget extends StatelessWidget {
  const ProductsErrorWidget({required this.error, super.key});

  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
