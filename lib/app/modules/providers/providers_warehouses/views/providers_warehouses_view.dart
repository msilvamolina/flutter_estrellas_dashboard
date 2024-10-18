import 'package:estrellas_dashboard/app/modules/providers/providers_warehouses/widgets/warehouse_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/layouts/main_layout/main_layout.dart';
import '../../../../components/appbars/appbar_title_with_back.dart';
import '../../../../components/widgets/custom_floating_action_button.dart';
import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';
import '../../../../routes/app_pages.dart';
import '../controllers/providers_warehouses_controller.dart';

class ProvidersWarehousesView extends GetView<ProvidersWarehousesController> {
  const ProvidersWarehousesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      showMenu: false,
      appBarWidget: const AppbarTitleWithBack(title: 'Bodegas'),
      maxWidth: double.infinity,
      currentRoute: Routes.PROVIDERS_WAREHOUSES,
      child: Column(
        children: [
          if (controller.provider.warehouses != null &&
              controller.provider.warehouses!.isNotEmpty)
            for (ProviderWarehouseModel element
                in controller.provider.warehouses!)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: WarehouseCard(warehouse: element),
              ),
        ],
      ),
    );
  }
}
