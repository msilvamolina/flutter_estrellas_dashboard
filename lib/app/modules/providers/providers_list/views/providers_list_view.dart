import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/providers_list_controller.dart';
import '../tabs/tab_estrellas_1.dart';
import '../tabs/tab_estrellas_2.dart';

class ProvidersListView extends GetView<ProvidersListController> {
  const ProvidersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainLayout(
        floatingActionButton: CustomFloatingActionButton(
          label: 'Agregar',
          icon: Icons.add,
          onPressed: () => Get.toNamed(Routes.CREATE_PRODUCT),
        ),
        maxWidth: double.infinity,
        currentRoute: Routes.PROVIDERS_LIST,
        appBarWidget: const TabBar(
          tabs: [
            Tab(text: 'Estrellas 1.0'),
            Tab(text: 'Estrellas 2.0'),
          ],
        ),
        child: TabBarView(
          children: [
            TabEstrellas1(controller: controller),
            TabEstrellas2(controller: controller),
          ],
        ),
      ),
    );
  }
}
