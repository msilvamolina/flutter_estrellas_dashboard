import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/copy_departments_controller.dart';

class CopyDepartmentsView extends GetView<CopyDepartmentsController> {
  const CopyDepartmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      maxWidth: 900,
      mainCurrentRoute: Routes.ADMIN,
      currentRoute: Routes.COPY_DEPARTMENTS,
      appBarTitle: 'Copy departments',
      child: GetBuilder<CopyDepartmentsController>(
        id: 'view',
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          );
        },
      ),
    );
  }
}
