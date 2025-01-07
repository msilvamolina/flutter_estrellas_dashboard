import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/widgets/button.dart';
import '../controllers/new_variations_controller.dart';
import '../widgets/variant_empty_state.dart';
import '../widgets/variations_card.dart';

class ProductVariantsCombinationsTab extends StatelessWidget {
  const ProductVariantsCombinationsTab({required this.controller, super.key});

  final NewVariationsController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => controller.showSaveButton.value
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                  child: Button(
                    onPressed: controller.saveVariants,
                    label: 'Guardar',
                  ),
                ),
              )
            : SizedBox.shrink(),
      ),
      body: Obx(
        () => controller.list.isNotEmpty
            ? ListView.separated(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return VariationsCard(
                    variation: controller.list[index],
                    controller: controller,
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            : const VariantEmptyState(),
      ),
    );
  }
}
