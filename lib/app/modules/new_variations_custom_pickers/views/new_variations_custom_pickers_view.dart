import 'package:estrellas_dashboard/app/modules/new_variations_custom_pickers/widgets/empty_state.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:get/get.dart';

import '../../../components/discovery_feature/discover_feature_appbar_button.dart';
import '../../../components/widgets/button.dart';
import '../../../themes/styles/colors.dart';
import '../controllers/new_variations_custom_pickers_controller.dart';
import '../widgets/attributes_card.dart';

class NewVariationsCustomPickersView
    extends GetView<NewVariationsCustomPickersController> {
  const NewVariationsCustomPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVariationsCustomPickersController>(
      id: 'page',
      builder: (_) {
        return Scaffold(
          bottomNavigationBar: Obx(
            () => controller.showButton.value
                ? SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 16, right: 16),
                      child: Button(
                        onPressed: controller.isButtonEnabled.value
                            ? controller.onSave
                            : null,
                        label: 'Guardar',
                      ),
                    ),
                  )
                : SizedBox.shrink(),
          ),
          appBar: AppBar(
            title: const Text('Crear Variaciones'),
            centerTitle: true,
            actions: [
              DiscoverFeatureAppBarButton(
                featureId: controller.guideTourName,
                icon: Icons.checklist,
                title: 'Agrega o modifica los atributos más tarde',
                description:
                    'Haciendo clic en esta opción, podrás volver a elegir los atributos en cualquier momento.',
                onIconPressed: controller.selectAttributes,
              ),
            ],
          ),
          body: Obx(
            () => !controller.isLoading.value
                ? controller.listAttributes.isNotEmpty
                    ? ListView.separated(
                        itemCount: controller.listAttributes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: AttributesCard(
                              attribute: controller.listAttributes[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox.shrink(),
                      )
                    : VariationsEmptyState()
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        );
      },
    );
  }
}
