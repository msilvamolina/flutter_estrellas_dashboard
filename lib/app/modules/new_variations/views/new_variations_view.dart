import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_variations_controller.dart';

class NewVariationsView extends GetView<NewVariationsController> {
  const NewVariationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewVariationsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewVariationsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
