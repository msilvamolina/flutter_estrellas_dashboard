import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/layouts/main_layout/main_layout.dart';
import '../../../components/widgets/custom_floating_action_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    bool isTablet2 = MediaQuery.of(context).size.width < 890;

    return MainLayout(
      currentRoute: Routes.PRODUCTS,
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar producto',
        icon: Icons.add,
        onPressed: () {},
      ),
      appBarTitle: 'Productos',
      child: Center(
        child: Text('holis'),
      ),
    );
  }
}
