import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/products_controller.dart';

class TabEstrellas1 extends StatelessWidget {
  const TabEstrellas1({required this.controller, super.key});

  final ProductsController controller;
  @override
  Widget build(BuildContext context) {
    controller.getDataVersion1();

    return GetBuilder<ProductsController>(
      builder: (_) {
        return Center(
          child: Text('holis :D'),
        );
      },
    );
  }
}
