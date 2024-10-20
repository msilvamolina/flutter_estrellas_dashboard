import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_city_controller.dart';

class SelectCityView extends GetView<SelectCityController> {
  const SelectCityView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectCityView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectCityView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
