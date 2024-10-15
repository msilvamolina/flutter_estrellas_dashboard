import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_images_controller.dart';

class ProductImagesView extends GetView<ProductImagesController> {
  const ProductImagesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: () => Get.toNamed(
          Routes.PRODUCT_ADD_IMAGE,
          arguments: controller.product,
        ),
      ),
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
