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
      child: NewVariationsCustomPickersView(),
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
            featureId: 'feature_icon_button',
            tapTarget: const Icon(Icons.attribution_outlined),
            title: const Text('Información importante'),
            description: const Text(
              'Toca este botón para descubrir más sobre esta funcionalidad.',
            ),
            backgroundColor: Colors.blueAccent,
            targetColor: Colors.white,
            textColor: Colors.white,
            child: IconButton(
              onPressed: () {
                print('IconButton presionado');
              },
              icon: const Icon(Icons.attribution_outlined),
            ),
          ),
        ],
      ),
      body: Center(
        child: Button(
          onPressed: () async {
            print('Botón "Descubrir" presionado');
            // Reinicia el estado de FeatureDiscovery antes de activarlo
            await FeatureDiscovery.clearPreferences(
                context, ['feature_icon_button']);
            FeatureDiscovery.discoverFeatures(
              context,
              ['feature_icon_button'], // IDs de las features a mostrar
            );
          },
          label: 'Descubrir',
        ),
      ),
    );
  }
}
