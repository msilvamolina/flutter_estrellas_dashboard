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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: DescribedFeatureOverlay(
          featureId: 'feature_icon_button',
          tapTarget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.add,
              size: 32,
              color: Colors.black,
            ),
          ),
          title: Text(
            'Agrega variaciones a este producto',
            style: TypographyStyle.h3Mobile.copyWith(color: white),
          ),
          description: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Haciendo clic en esta opción, podrás volver elegir diferentes atributos y combinaciones',
                style: TypographyStyle.bodyRegularLarge.copyWith(color: white),
              ),
            ],
          ),
          backgroundColor: Colors.black,
          backgroundOpacity: 0.9,
          targetColor: Colors.white,
          textColor: Colors.white,
          overflowMode: OverflowMode.clipContent,
          child: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: controller.createVariants,
          ),
        ),
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
    );
  }
}
