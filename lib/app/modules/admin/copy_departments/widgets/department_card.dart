import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  const DepartmentCard({required this.department, super.key});

  final DepartmentModel department;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(department.toString()),
      ),
    );
  }
}
