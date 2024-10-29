import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_variant_combinations_controller.dart';

class ProductVariantCombinationsView
    extends GetView<ProductVariantCombinationsController> {
  const ProductVariantCombinationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.buildCombinations,
        child: Icon(Icons.build),
      ),
      appBar: AppBar(
        title: const Text('ProductVariantCombinationsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductVariantCombinationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
