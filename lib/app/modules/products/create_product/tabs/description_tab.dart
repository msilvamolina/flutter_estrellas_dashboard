import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../components/quill_toolbar.dart';
import '../controllers/create_product_controller.dart';

class ProductDescriptionTab extends StatelessWidget {
  const ProductDescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(
      builder: (controller) {
        return SafeArea(
          child: Column(
            children: [
              CustomToolbar(controller: controller.descriptionController),
              Expanded(
                child: QuillEditor(
                  controller: controller.descriptionController,
                  scrollController:
                      controller.descriptionEditorScrollController,
                  focusNode: controller.descriptionEditorFocusNode,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
