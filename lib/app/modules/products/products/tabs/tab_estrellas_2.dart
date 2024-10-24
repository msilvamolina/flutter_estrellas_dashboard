import 'package:estrellas_dashboard/app/modules/products/products/widgets/product_firebase_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';
import '../widgets/product_card.dart';

class TabEstrellas2 extends StatelessWidget {
  const TabEstrellas2({required this.controller, super.key});

  final ProductsController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.list.isNotEmpty
          ? ListView.separated(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 8 : 0,
                      bottom: index == (controller.list.length - 1) ? 48 : 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ProductFirebaseCard(
                      product: controller.list[index],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            )
          : const Text('no data'),
    );
  }
}
