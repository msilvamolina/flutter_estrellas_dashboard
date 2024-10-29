import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_variant_for_type_controller.dart';

class ProductVariantForTypeView
    extends GetView<ProductVariantForTypeController> {
  const ProductVariantForTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductVariantForTypeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductVariantForTypeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
