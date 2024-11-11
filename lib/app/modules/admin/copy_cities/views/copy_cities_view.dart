import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/copy_cities_controller.dart';

class CopyCitiesView extends GetView<CopyCitiesController> {
  const CopyCitiesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CopyCitiesView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CopyCitiesView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
