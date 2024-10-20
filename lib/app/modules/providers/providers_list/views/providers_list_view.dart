import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/providers_list_controller.dart';
import '../widgets/providers_error_widget.dart';
import '../widgets/providers_list_widget.dart';
import '../widgets/providers_loading_widget.dart';

class ProvidersListView extends GetView<ProvidersListController> {
  const ProvidersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      floatingActionButton: CustomFloatingActionButton(
        label: 'Agregar',
        icon: Icons.add,
        onPressed: () => Get.toNamed(Routes.CREATE_PROVIDER),
      ),
      appBarTitle: 'Proveedores',
      maxWidth: double.infinity,
      currentRoute: Routes.PROVIDERS_LIST,
      child: GetBuilder<ProvidersListController>(
        id: 'view',
        builder: (_) {
          return !controller.isLoading
              ? controller.responseError != null
                  ? ProvidersErrorWidget(error: controller.responseError!)
                  : ProvidersListWidget(list: controller.data)
              : const ProvidersLoadingWidget();
        },
      ),
    );
  }
}
