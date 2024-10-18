import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/providers_estrellas_1_controller.dart';

class ProvidersEstrellas1View extends GetView<ProvidersEstrellas1Controller> {
  const ProvidersEstrellas1View({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProvidersEstrellas1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ProvidersEstrellas1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
