import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:stylish_pull_to_refresh/stylish_pull_to_refresh.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/adminscaffold/admin_scaffold.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/user_permissions.dart';
import '../../../../themes/styles/colors.dart';
import '../controllers/providers_list_controller.dart';
import '../widgets/provider_card.dart';
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
        onPressed: controller.addProvider,
      ),
      appBarTitle: 'Proveedores',
      maxWidth: double.infinity,
      currentRoute: Routes.PROVIDERS_LIST,
      child: StylishPullToRefresh(
        style: Style.handGesture,
        onRefresh: () async {
          // await controller.getData();
        },
        child: AdminScaffold(
          permission: Permissions.providerList,
          child: GetBuilder<ProvidersListController>(
            id: 'view',
            builder: (_) {
              return Obx(
                () => ListView.separated(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return ProviderCard(
                      provider: controller.list[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
