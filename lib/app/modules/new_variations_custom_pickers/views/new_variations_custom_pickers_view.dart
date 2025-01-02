import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:get/get.dart';

import '../../../components/widgets/button.dart';
import '../controllers/new_variations_custom_pickers_controller.dart';

class NewVariationsCustomPickersFeatureView extends StatelessWidget {
  const NewVariationsCustomPickersFeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return FeatureDiscovery(
      child: SafeArea(child: NewVariationsCustomPickersView()),
    );
  }
}

class NewVariationsCustomPickersView
    extends GetView<NewVariationsCustomPickersController> {
  const NewVariationsCustomPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewVariationsCustomPickersView'),
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
            description: const Text(
              'Toca este botón para descubrir más sobre esta funcionalidad.',
            ),
            backgroundColor: Colors.blueAccent,
            targetColor: Colors.red,
            textColor: Colors.white,
            overflowMode: OverflowMode.clipContent,
            child: IconButton(
              onPressed: () {
                print('IconButton presionado');
              },
              icon: const Icon(Icons.attribution_outlined),
            ),
          ),
        ],
      ),
      floatingActionButton: DescribedFeatureOverlay(
        contentLocation: ContentLocation.above,
        featureId: 'feature_floating_action',
        tapTarget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.attribution_outlined, size: 32),
        ),
        title: const Text('Información importante'),
        description: const Text(
          'Toca este botón para descubrir más sobre esta funcionalidad.',
        ),
        backgroundColor: Colors.blueAccent,
        targetColor: Colors.red,
        textColor: Colors.white,
        overflowMode: OverflowMode.clipContent,
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.abc),
        ),
      ),
      body: Center(
        child: Button(
          onPressed: () async {
            print('Botón "Descubrir" presionado');
            await FeatureDiscovery.clearPreferences(
                context, ['feature_icon_button', 'feature_floating_action']);
            FeatureDiscovery.discoverFeatures(
              context,
              ['feature_icon_button', 'feature_floating_action'],
            );
          },
          label: 'Descubrir',
        ),
      ),
    );
  }
}
