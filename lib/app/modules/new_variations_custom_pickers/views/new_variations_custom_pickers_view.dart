import 'package:estrellas_dashboard/app/modules/new_variations_custom_pickers/widgets/empty_state.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:get/get.dart';

import '../../../components/widgets/button.dart';
import '../../../themes/styles/colors.dart';
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
              child: Icon(
                Icons.checklist,
                size: 32,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Agrega o modifica los atributos más tarde',
              style: TypographyStyle.h3Mobile.copyWith(color: white),
            ),
            description: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Haciendo clic en esta opción, podrás volver a elegir los atributos en cualquier momento.',
                  style:
                      TypographyStyle.bodyRegularLarge.copyWith(color: white),
                ),
              ],
            ),
            backgroundColor: Colors.black,
            backgroundOpacity: 0.9,
            targetColor: Colors.white,
            textColor: Colors.white,
            overflowMode: OverflowMode.clipContent,
            child: IconButton(
              onPressed: controller.selectAttributes,
              icon: const Icon(Icons.checklist),
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
