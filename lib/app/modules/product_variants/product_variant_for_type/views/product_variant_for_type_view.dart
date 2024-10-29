import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_variant_for_type_controller.dart';

class ProductVariantForTypeView
    extends GetView<ProductVariantForTypeController> {
  const ProductVariantForTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: controller.addVariant,
      ),
      appBar: AppBar(
        title: Text(controller.typeSelected.name.toString()),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(
          () => Text(
            controller.list.toString(),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
