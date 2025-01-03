import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_variations_controller.dart';
import '../widgets/variations_card.dart';

class ProductVariantsCombinationsTab extends StatelessWidget {
  const ProductVariantsCombinationsTab({required this.controller, super.key});

  final NewVariationsController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.list.isNotEmpty
          ? ListView.separated(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return VariationsCard(
                  variation: controller.list[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            )
          : const Text('no data'),
    );
  }
}
