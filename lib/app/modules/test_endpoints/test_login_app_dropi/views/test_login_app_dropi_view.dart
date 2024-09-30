import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/test_api/api_card.dart';
import '../../../../components/test_api/api_success_card.dart';
import '../../../../components/test_api/json_view.dart';
import '../../../../components/test_api/success_card.dart';
import '../../../../components/utils/expanded_or_null.dart';
import '../../../../components/utils/row_or_column.dart';
import '../../../../components/utils/sizedbox_responsive.dart';
import '../../../../components/widgets/loadingButton.dart';
import '../../../../routes/app_pages.dart';
import '../../../../themes/input_decoration.dart';
import '../../../../utils/responsive.dart';
import '../controllers/test_login_app_dropi_controller.dart';

class TestLoginAppDropiView extends GetView<TestLoginAppDropiController> {
  const TestLoginAppDropiView({super.key});
  @override
  Widget build(BuildContext context) {
    bool breakingPoint = !Responsive.isMobile(context);
    return MainLayout(
      maxWidth: 900,
      mainCurrentRoute: Routes.TEST_ENDPOINTS,
      currentRoute: Routes.TEST_LOGIN_APP_DROPI,
      appBarTitle: 'Test Login App Dropi',
      child: GetBuilder<TestLoginAppDropiController>(
        id: 'view',
        builder: (_) {
          return ReactiveFormBuilder(
              form: controller.buildForm,
              builder: (context, form, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApiSuccessCard(
                      url: controller.url,
                      success: controller.success.toString(),
                      statusCode: controller.statusCode.toString(),
                    ),
                    const SizedBox(height: 24),
                    RowOrColumn(
                      breakingPoint: breakingPoint,
                      children: [
                        ExpandedOrNull(
                          breakingPoint: breakingPoint,
                          child: ReactiveTextField(
                            formControlName: Fields.email.name,
                            keyboardType: TextInputType.emailAddress,
                            decoration: CustomInputDecoration.inputDecoration(
                              text: "E-mail",
                              icon: Icons.email,
                            ),
                          ),
                        ),
                        SizedBoxResponsive(
                          value: 16,
                          breakingPoint: breakingPoint,
                        ),
                        ExpandedOrNull(
                          breakingPoint: !Responsive.isMobile(context),
                          child: ReactiveTextField(
                            formControlName: Fields.email.name,
                            keyboardType: TextInputType.emailAddress,
                            decoration: CustomInputDecoration.inputDecoration(
                              text: "E-mail",
                              icon: Icons.email,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // LoadingButton(
                    //   label: 'Get Info',
                    //   isLoading: controller.loading,
                    //   onPressed: controller.getInfo,
                    // ),
                    const SizedBox(height: 16),

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
              });
        },
      ),
    );
  }
}
