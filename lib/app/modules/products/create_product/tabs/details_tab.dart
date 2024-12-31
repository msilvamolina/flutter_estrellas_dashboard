import 'package:estrellas_dashboard/app/modules/products/create_product/controllers/create_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../components/quill_toolbar.dart';
import '../components/warranty_toolbar.dart';

class ProductDetailsTab extends StatelessWidget {
  const ProductDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            children: [
              SimpleCustomToolbar(controller: controller.detailsController),
              Expanded(
                child: QuillEditor(
                  controller: controller.detailsController,
                  scrollController: controller.detailsEditorScrollController,
                  focusNode: controller.detailsEditorFocusNode,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
