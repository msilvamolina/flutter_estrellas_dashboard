import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({required this.department, super.key});

  final DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.COPY_CITIES, arguments: department),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(department.toString()),
        ),
      ),
    );
  }
}
