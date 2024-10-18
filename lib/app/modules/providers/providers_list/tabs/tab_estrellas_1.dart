import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_error_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_list_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/produtcs_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/providers_list_controller.dart';
import '../widgets/providers_error_widget.dart';
import '../widgets/providers_list_widget.dart';
import '../widgets/providers_loading_widget.dart';

class TabEstrellas1 extends StatelessWidget {
  const TabEstrellas1({required this.controller, super.key});

  final ProvidersListController controller;
  @override
  Widget build(BuildContext context) {
    controller.getDataVersion1();

    return GetBuilder<ProvidersListController>(
      id: 'tab1View',
      builder: (_) {
        return !controller.isLoading
            ? controller.responseError != null
                ? ProvidersErrorWidget(error: controller.responseError!)
                : ProvidersListWidget(list: controller.data)
            : const ProvidersLoadingWidget();
      },
    );
  }
}
