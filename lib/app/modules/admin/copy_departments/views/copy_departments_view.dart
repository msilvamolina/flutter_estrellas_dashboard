import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/copy_departments_controller.dart';
import '../tabs/tabs_departments_1.dart';
import '../tabs/tabs_departments_2.dart';

class CopyDepartmentsView extends GetView<CopyDepartmentsController> {
  const CopyDepartmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MainLayout(
        maxWidth: 900,
        mainCurrentRoute: Routes.ADMIN,
        currentRoute: Routes.COPY_DEPARTMENTS,
        appBarTitle: 'Copy departments',
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
