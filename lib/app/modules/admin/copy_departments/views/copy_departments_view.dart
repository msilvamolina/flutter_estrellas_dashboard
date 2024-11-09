import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/copy_departments_controller.dart';

class CopyDepartmentsView extends GetView<CopyDepartmentsController> {
  const CopyDepartmentsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CopyDepartmentsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CopyDepartmentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
