import 'package:estrellas_dashboard/app/modules/providers/providers_list/widgets/provider_card.dart';
import 'package:estrellas_dashboard/app/modules/selects/select_provider/widgets/provider_warehouse_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../themes/styles/typography.dart';
import '../controllers/select_provider_controller.dart';

class SelectProviderView extends GetView<SelectProviderController> {
  const SelectProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Elegí un proveedor'),
        centerTitle: true,
      ),
      body: GetBuilder<SelectProviderController>(
        id: 'view',
        builder: (_) {
          if (!controller.isLoading) {
            return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                      top: index == 0 ? 8 : 0,
                      bottom: index == (controller.data.length - 1) ? 48 : 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        ProviderWarehouseCard(provider: controller.data[index]),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
