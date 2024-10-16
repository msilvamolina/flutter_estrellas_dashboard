import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/create_product_controller.dart';

class CreateProductView extends GetView<CreateProductController> {
  const CreateProductView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showMenu: false,
      currentRoute: Routes.CREATE_PRODUCT,
      appBarTitle: 'Crear producto',
      child: Column(
        children: [
          const SizedBox(height: 16),
          LoadingButton(
            label: 'Crear',
            isLoading: controller.isLoading,
            onPressed: controller.createProduct,
          ),
          const SizedBox(height: 16),
          LoadingButton(
            label: 'createProvider',
            isLoading: controller.isLoading,
            onPressed: controller.createProvider,
          ),
          const SizedBox(height: 16),
          LoadingButton(
            label: 'getProviders',
            isLoading: controller.isLoading,
            onPressed: controller.getProviders,
          ),
          const SizedBox(height: 16),
          LoadingButton(
            label: 'getNewProducts',
            isLoading: controller.isLoading,
            onPressed: controller.getNewProducts,
          ),
          const SizedBox(height: 16),
          LoadingButton(
            label: 'createOrder',
            isLoading: controller.isLoading,
            onPressed: controller.createOrder,
          ),
        ],
      ),
    );
  }
}
