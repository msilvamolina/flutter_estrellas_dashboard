import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/product_estrellas_1_controller.dart';

class ProductEstrellas1View extends GetView<ProductEstrellas1Controller> {
  const ProductEstrellas1View({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        maxWidth: double.infinity,
        currentRoute: Routes.PRODUCT_ESTRELLAS_1,
        // appBarWidget: const TabBar(
        //   tabs: [
        //     Tab(text: 'Estrellas 1.0'),
        //     Tab(text: 'Estrellas 2.0'),
        //   ],
        // ),
        child: Center(
          child: Text('asdasda'),
        ));
  }
}
