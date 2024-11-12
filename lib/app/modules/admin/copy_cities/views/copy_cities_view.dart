import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/copy_cities_controller.dart';
import '../tabs/tab_city_estrellas_1.dart';
import '../tabs/tab_city_estrellas_2.dart';

class CopyCitiesView extends GetView<CopyCitiesController> {
  const CopyCitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainLayout(
        maxWidth: 900,
        showMenu: false,
        currentRoute: Routes.COPY_CITIES,
        appBarTitle: controller.departmentModel.name,
        floatingActionButton: CustomFloatingActionButton(
          label: 'Copy to firebase',
          icon: Icons.cloud_sync_sharp,
          onPressed: controller.copyToFirebase,
        ),
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
