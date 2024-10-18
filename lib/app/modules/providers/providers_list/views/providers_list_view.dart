import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/providers_list_controller.dart';

class ProvidersListView extends GetView<ProvidersListController> {
  const ProvidersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProvidersListView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProvidersListView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
