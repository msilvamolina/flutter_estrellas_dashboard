import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/button.dart';
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
              Row(
                children: [
                  Text(
                    'API: ',
                    style: TypographyStyle.bodyBlackLarge,
                  ),
                  Text(
                    controller.baseUrl,
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
                    controller.url,
                    style: TypographyStyle.bodyBlackMedium,
                  ),
                ],
              ),
              SizedBox(height: 24),
              Button(
                label: 'Get Info',
                onPressed: controller.getInfo,
              ),
              SizedBox(height: 18),
              Text(
                'Result: ',
                style: TypographyStyle.h3Mobile,
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: JsonEditorTheme(
                  themeData: JsonEditorThemeData(
                    darkTheme:
                        JsonEditorThemeData.defaultTheme().darkTheme!.copyWith(
                              defaultStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              errorStyle: TextStyle(color: Colors.pink[100]),
                              keyStyle: TextStyle(color: Colors.white),
                              boolStyle: TextStyle(color: Colors.yellow[100]),
                              numberStyle: TextStyle(color: Colors.yellow[100]),
                              stringStyle: TextStyle(color: Colors.amber),
                              bracketStyle:
                                  TextStyle(color: Colors.yellow, fontSize: 22),
                            ),
                    lightTheme:
                        JsonEditorThemeData.defaultTheme().lightTheme!.copyWith(
                              defaultStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.primary),
                              errorStyle: TextStyle(color: Colors.pink),
                              keyStyle: TextStyle(color: Colors.white),
                              boolStyle: TextStyle(color: Colors.orange),
                              numberStyle: TextStyle(color: Colors.orange),
                              stringStyle: TextStyle(color: Colors.orange),
                              bracketStyle:
                                  TextStyle(color: Colors.purple, fontSize: 22),
                            ),
                  ),
                  child: JsonEditor.string(
                    enabled: false,
                    jsonString: controller.result.toString(),
                    // onValueChanged: viewModel.onValueChanged,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
