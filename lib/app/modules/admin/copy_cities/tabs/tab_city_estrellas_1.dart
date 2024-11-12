import 'package:estrellas_dashboard/app/modules/admin/copy_cities/widgets/cities_list_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_error_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_list_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/produtcs_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/copy_cities_controller.dart';

class TabEstrellas1 extends StatelessWidget {
  const TabEstrellas1({required this.controller, super.key});

  final CopyCitiesController controller;
  @override
  Widget build(BuildContext context) {
    controller.getDataVersion1();

    return GetBuilder<CopyCitiesController>(
      id: 'tab1View',
      builder: (_) {
        return !controller.isLoading
            ? controller.responseError != null
                ? ProductsErrorWidget(error: controller.responseError!)
                : CitiesListWidget(list: controller.data)
            : const ProdutcsLoadingWidget();
      },
    );
  }
}
