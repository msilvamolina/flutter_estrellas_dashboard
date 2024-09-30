import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/test_api/api_card.dart';
import '../../../../components/test_api/success_card.dart';
import '../../../../components/widgets/button.dart';
import '../../../../components/test_api/json_view.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/test_get_products_controller.dart';
import 'package:json_editor/json_editor.dart';

class TestGetProductsView extends GetView<TestGetProductsController> {
  const TestGetProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      mainCurrentRoute: Routes.TEST_ENDPOINTS,
      currentRoute: Routes.TEST_GET_PRODUCTS,
      appBarTitle: 'Test Get Products',
      child: GetBuilder<TestGetProductsController>(
        id: 'view',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApiCard(
                url: controller.url,
              ),
              SizedBox(height: 24),
              LoadingButton(
                label: 'Get Info',
                isLoading: controller.loading,
                onPressed: controller.getInfo,
              ),
              SizedBox(height: 18),
              Text(
                'Result: ',
                style: TypographyStyle.h3Mobile,
              ),
              const SizedBox(height: 8),
              if (controller.success != null)
                SuccessCard(
                  success: controller.success.toString(),
                  statusCode: controller.statusCode.toString(),
                ),
              const SizedBox(height: 16),
              if (controller.result != null)
                Expanded(
                  child: JsonView(
                    jsonString: controller.result.toString(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
