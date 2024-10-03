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
    return DefaultTabController(
      length: 2,
      child: MainLayout(
        maxWidth: 800,
        currentRoute: Routes.PRODUCTS,
        floatingActionButton: CustomFloatingActionButton(
          label: 'Agregar producto',
          icon: Icons.add,
          onPressed: () {},
        ),
        appBarWidget: TabBar(
          tabs: const [
            Tab(text: 'Estrellas 1.0'),
            Tab(text: 'Estrellas 2.0'),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: const [
                  Center(child: Text('Vista de Lista de Productos')),
                  Center(child: Text('Vista de Estadísticas')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
