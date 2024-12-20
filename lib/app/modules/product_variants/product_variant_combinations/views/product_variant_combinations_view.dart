// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// import '../controllers/product_variant_combinations_controller.dart';
// import '../widgets/combination_card.dart';

// class ProductVariantCombinationsView
//     extends GetView<ProductVariantCombinationsController> {
//   const ProductVariantCombinationsView({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: controller.sendVariations,
//             child: Icon(Icons.send),
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed: controller.buildCombinations,
//             child: Icon(Icons.build),
//           ),
//         ],
//       ),
//       appBar: AppBar(
//         title: const Text('Combinaciones'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Obx(
//           () => controller.listCombination.isNotEmpty
//               ? ListView.separated(
//                   itemCount: controller.listCombination.length,
//                   itemBuilder: (context, index) {
//                     return CombinationCard(
//                       product: controller.product,
//                       combinationElement: controller.listCombination[index],
//                     );
//                   },
//                   separatorBuilder: (context, index) =>
//                       const SizedBox(height: 10),
//                 )
//               : const Text('no data'),
//         ),
//       ),
//     );
//   }
// }
