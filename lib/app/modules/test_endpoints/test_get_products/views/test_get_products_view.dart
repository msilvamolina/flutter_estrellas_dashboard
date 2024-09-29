import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/button.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'API: ',
                style: TypographyStyle.bodyBlackLarge,
              ),
              Text(
                'Endpoint: ',
                style: TypographyStyle.bodyBlackMedium,
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Endpoint: ',
                style: TypographyStyle.bodyBlackLarge,
              ),
              Text(
                'Endpoint: ',
                style: TypographyStyle.bodyBlackMedium,
              ),
            ],
          ),
          SizedBox(height: 24),
          Button(
            label: 'Get Products',
            onPressed: () {},
          ),
          SizedBox(height: 18),
          Text(
            'Result',
            style: TypographyStyle.h3Mobile,
          ),
        ],
      ),
    );
  }
}
