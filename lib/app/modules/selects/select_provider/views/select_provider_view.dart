import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/select_provider_controller.dart';

class SelectProviderView extends GetView<SelectProviderController> {
  const SelectProviderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectProviderView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectProviderView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
