import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/layouts/main_layout/main_layout.dart';
import '../../../components/widgets/custom_floating_action_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/products_controller.dart';
import '../tabs/tab_estrellas_1.dart';
import '../tabs/tab_estrellas_2.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: MainLayout(
        maxWidth: double.infinity,
        currentRoute: Routes.PRODUCTS,
        appBarWidget: TabBar(
          tabs: [
            Tab(text: 'Estrellas 1.0'),
            Tab(text: 'Estrellas 2.0'),
          ],
        ),
        child: TabBarView(
          children: [
            TabEstrellas1(),
            TabEstrellas2(),
          ],
        ),
      ),
    );
  }
}
