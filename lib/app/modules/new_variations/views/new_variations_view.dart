import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/new_variations_controller.dart';
import '../tabs/product_variants_combinations_tab.dart';
import '../tabs/product_variants_tab.dart';
import '../widgets/variations_card.dart';

class NewVariationsView extends GetView<NewVariationsController> {
  const NewVariationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.layers),
          onPressed: () => Get.toNamed(
            Routes.NEW_VARIATIONS,
            arguments: controller.product,
          ),
        ),
        appBar: AppBar(
          title: Text('Variaciones'),
        ),
        body: Column(
          children: [
            TabBar(
              tabs: [
                Tab(text: 'Variaciones'),
                Tab(text: 'Combinaciones'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProductVariantsTab(controller: controller),
                  ProductVariantsCombinationsTab(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
