import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_variant_combinations_controller.dart';
import '../widgets/combination_card.dart';

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
        title: const Text('Combinaciones'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.listCombination.isNotEmpty
            ? ListView.separated(
                itemCount: controller.listCombination.length,
                itemBuilder: (context, index) {
                  return CombinationCard(
                    combinationElement: controller.listCombination[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              )
            : const Text('no data'),
      ),
    );
  }
}
