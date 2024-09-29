import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/test_get_products_controller.dart';

class TestGetProductsView extends GetView<TestGetProductsController> {
  const TestGetProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      mainCurrentRoute: Routes.TEST_ENDPOINTS,
      currentRoute: Routes.TEST_GET_PRODUCTS,
      appBarTitle: 'Test Get Products',
      child: Center(
        child: Text('Test Get Products'),
      ),
    );
  }
}
