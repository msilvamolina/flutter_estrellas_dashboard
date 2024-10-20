import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_department_controller.dart';

class SelectDepartmentView extends GetView<SelectDepartmentController> {
  const SelectDepartmentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectDepartmentView'),
        centerTitle: true,
      ),
      body: GetBuilder<SelectDepartmentController>(
        id: 'view',
        builder: (_) {
          if (!controller.isLoading) {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 8 : 0,
                      bottom: index == (controller.data.length - 1) ? 48 : 0),
                  child: ListTile(
                    onTap: () => controller.onTap(controller.data[index]),
                    title: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        controller.data[index].name,
                        style: TypographyStyle.bodyBlackLarge,
                      ),
                    ),
                    trailing: const Icon(Icons.chevron_right_rounded),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
