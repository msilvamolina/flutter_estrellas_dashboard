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
      child: SingleChildScrollView(
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
            const SizedBox(height: 16),
            LoadingButton(
              label: 'createMultipleOrder',
              isLoading: controller.isLoading,
              onPressed: controller.createMultipleOrder,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'get order OrderById',
              isLoading: controller.isLoading,
              onPressed: controller.getOrderById,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'get Multiple OrderById',
              isLoading: controller.isLoading,
              onPressed: controller.getMultipleOrderById,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'getDepartments',
              isLoading: controller.isLoading,
              onPressed: controller.getDepartments,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'getCities',
              isLoading: controller.isLoading,
              onPressed: controller.getCities,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'getCategories',
              isLoading: controller.isLoading,
              onPressed: controller.getCategories,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'getOrders',
              isLoading: controller.isLoading,
              onPressed: controller.getOrders,
            ),
            const SizedBox(height: 16),
            LoadingButton(
              label: 'createWarehouse',
              isLoading: controller.isLoading,
              onPressed: controller.createWarehouse,
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
