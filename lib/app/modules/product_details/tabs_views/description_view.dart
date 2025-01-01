import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class DescriptionView extends StatelessWidget {
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_info',
      builder: (controller) {
        return QuillEditor(
          controller: controller.descriptionController,
          scrollController: controller.descriptionEditorScrollController,
          focusNode: controller.descriptionEditorFocusNode,
        );
      },
    );
  }
}
