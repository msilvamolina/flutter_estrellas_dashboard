import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../new_variations_custom_pickers/widgets/attributes_card.dart';
import '../../new_variations_custom_pickers/widgets/empty_state.dart';
import '../controllers/new_variations_controller.dart';

class ProductVariantsTab extends StatelessWidget {
  const ProductVariantsTab({required this.controller, super.key});

  final NewVariationsController controller;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVariationsController>(
      id: 'view',
      builder: (_) {
        if (!controller.isLoading.value)
          return Center(
            child: Text(controller.variantInfoModel.toString()),
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
