import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../themes/styles/colors.dart';
import '../../../themes/styles/typography.dart';
import '../controllers/new_variations_controller.dart';
import '../tabs/product_variants_combinations_tab.dart';
import '../tabs/product_variants_tab.dart';
import '../widgets/variations_card.dart';

class NewVariationsView extends GetView<NewVariationsController> {
  const NewVariationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVariationsController>(
      id: 'view',
      builder: (_) {
        return Obx(
          () => DefaultTabController(
            length: controller.list.isEmpty ? 0 : 2,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Variantes'),
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
          ),
        );
      },
    );
  }
}
