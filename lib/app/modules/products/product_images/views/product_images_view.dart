import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_images_controller.dart';

class ProductImagesView extends GetView<ProductImagesController> {
  const ProductImagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductImagesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProductImagesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
