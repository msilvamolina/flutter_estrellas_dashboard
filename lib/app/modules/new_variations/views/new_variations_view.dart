import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/new_variations_controller.dart';

class NewVariationsView extends GetView<NewVariationsController> {
  const NewVariationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () => Get.toNamed(
          Routes.NEW_VARIATIONS_PICKERS,
          arguments: controller.product,
        ),
      ),
      appBar: AppBar(
        title: const Text('Variaciones'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => controller.list.isNotEmpty
              ? ListView.separated(
                  itemCount: controller.list.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          controller.list[index].toString(),
                        ),
                      ),
                    );
                    // return CombinationCard(
                    //   product: controller.product,
                    //   combinationElement: controller.list[index],
                    // );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                )
              : const Text('no data'),
        ),
      ),
    );
  }
}
