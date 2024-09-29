import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../app/layouts/main_layout/main_layout.dart';
import '../../../components/widgets/button.dart';
import '../controllers/test_endpoints_controller.dart';

class TestEndpointsView extends GetView<TestEndpointsController> {
  const TestEndpointsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentRoute: Routes.TEST_ENDPOINTS,
      appBarTitle: 'Test endpoints',
      child: Column(
        children: [
          Button(
            label: 'Get Products',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
