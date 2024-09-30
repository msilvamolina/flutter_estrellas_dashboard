import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/test_api/api_card.dart';
import '../../../../components/test_api/json_view.dart';
import '../../../../components/test_api/success_card.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/responsive.dart';
import '../controllers/test_login_app_dropi_controller.dart';

class TestLoginAppDropiView extends GetView<TestLoginAppDropiController> {
  const TestLoginAppDropiView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      maxWidth: 900,
      mainCurrentRoute: Routes.TEST_ENDPOINTS,
      currentRoute: Routes.TEST_LOGIN_APP_DROPI,
      appBarTitle: 'Test Login App Dropi',
      child: GetBuilder<TestLoginAppDropiController>(
        id: 'view',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ApiCard(url: controller.url),
              const SizedBox(height: 24),
              LoadingButton(
                label: 'Get Info',
                isLoading: controller.loading,
                onPressed: controller.getInfo,
              ),
              const SizedBox(height: 16),
              if (Responsive.isTablet(context))
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SuccessCard(
                    success: controller.success.toString(),
                    statusCode: controller.statusCode.toString(),
                  ),
                ),
              if (controller.result != null)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!Responsive.isTablet(context))
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: SuccessCard(
                            success: controller.success.toString(),
                            statusCode: controller.statusCode.toString(),
                          ),
                        ),
                      Expanded(
                        child: JsonView(
                          json: controller.result,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
