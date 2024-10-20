import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_warehouse_controller.dart';

class SelectWarehouseView extends GetView<SelectWarehouseController> {
  const SelectWarehouseView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectWarehouseView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectWarehouseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
