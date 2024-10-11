import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';

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
                return Text(controller.list[index].toString());
              },
              separatorBuilder: (context, index) => const SizedBox(height: 10),
            )
          : const Text('no data'),
    );
  }
}
