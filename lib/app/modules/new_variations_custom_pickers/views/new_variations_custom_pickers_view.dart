import 'package:estrellas_dashboard/app/modules/new_variations_custom_pickers/widgets/empty_state.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:get/get.dart';

import '../../../components/widgets/button.dart';
import '../controllers/new_variations_custom_pickers_controller.dart';

class NewVariationsCustomPickersView
    extends GetView<NewVariationsCustomPickersController> {
  const NewVariationsCustomPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Variaciones'),
        centerTitle: true,
        actions: [
          DescribedFeatureOverlay(
            contentLocation: ContentLocation.below,
            featureId: 'feature_icon_button',
            tapTarget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.attribution_outlined, size: 32),
            ),
            title: const Text('Información importante'),
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                    'Tap the magnifying glass to quickly scan your compounds'),
              ],
            ),
            backgroundColor: Colors.purple,
            backgroundOpacity: 0.9,
            targetColor: Colors.red,
            textColor: Colors.white,
            overflowMode: OverflowMode.clipContent,
            child: IconButton(
              onPressed: controller.selectAttributes,
              icon: const Icon(Icons.attribution_outlined),
            ),
          ),
        ],
      ),
      body: Obx(() => controller.listAttributes.isEmpty
          ? VariationsEmptyState()
          : Center(child: Text(controller.listAttributes.toString()))),
    );
  }
}
