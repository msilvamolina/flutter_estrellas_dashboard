import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/new_variations_controller.dart';

class NewVariationsView extends GetView<NewVariationsController> {
  const NewVariationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () => Get.toNamed(
          Routes.NEW_VARIATIONS_PICKERS,
          arguments: controller.product,
        ),
      ),
      appBar: AppBar(
        title: const Text('NewVariationsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewVariationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
