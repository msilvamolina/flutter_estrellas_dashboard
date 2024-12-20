import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/services/user_permissions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/products_controller.dart';
import '../tabs/tab_estrellas_2.dart';
import 'products_view2.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    bool userPermissions =
        mainController.checkUserPermission(Permissions.productsV1V2);

    return userPermissions
        ? MainLayout(
            floatingActionButton: CustomFloatingActionButton(
              label: 'Agregar',
              icon: Icons.add,
              onPressed: () => Get.toNamed(Routes.CREATE_PRODUCT),
            ),
            maxWidth: double.infinity,
            currentRoute: Routes.PRODUCTS,
            child: TabEstrellas2(controller: controller),
          )
        : ProductsView2();
  }
}
