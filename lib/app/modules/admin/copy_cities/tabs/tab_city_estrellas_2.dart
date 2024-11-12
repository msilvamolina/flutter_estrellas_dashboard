import 'package:estrellas_dashboard/app/modules/admin/copy_cities/controllers/copy_cities_controller.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_error_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/products_list_widget.dart';
import 'package:estrellas_dashboard/app/modules/products/products/widgets/produtcs_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabEstrellas2 extends StatelessWidget {
  const TabEstrellas2({required this.controller, super.key});

  final CopyCitiesController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CopyCitiesController>(
      id: 'tab2View',
      builder: (_) {
        return Text('holis');
      },
    );
  }
}
