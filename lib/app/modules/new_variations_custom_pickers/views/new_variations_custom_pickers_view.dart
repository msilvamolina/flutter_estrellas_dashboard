import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/new_variations_custom_pickers_controller.dart';

class NewVariationsCustomPickersView
    extends GetView<NewVariationsCustomPickersController> {
  const NewVariationsCustomPickersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewVariationsCustomPickersView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NewVariationsCustomPickersView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
