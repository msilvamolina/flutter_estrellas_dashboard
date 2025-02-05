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
        title: Text('Elegí una bodega'),
        centerTitle: true,
      ),
      body: GetBuilder<SelectProviderController>(
        id: 'view',
        builder: (_) {
          return Obx(
            () => ListView.separated(
              itemCount: controller.list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ProviderWarehouseCard(
                    provider: controller.list[index],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8),
            ),
          );
        },
      ),
    );
  }
}
