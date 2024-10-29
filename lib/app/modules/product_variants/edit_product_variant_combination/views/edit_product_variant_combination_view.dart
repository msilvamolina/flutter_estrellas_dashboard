import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_product_variant_combination_controller.dart';

class EditProductVariantCombinationView
    extends GetView<EditProductVariantCombinationController> {
  const EditProductVariantCombinationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EditProductVariantCombinationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EditProductVariantCombinationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
