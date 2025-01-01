import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../controllers/product_details_controller.dart';

class WarrantyView extends StatelessWidget {
  const WarrantyView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      id: 'product_info',
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: QuillEditor(
            config: QuillEditorConfig(
              showCursor: false,
              checkBoxReadOnly: true,
            ),
            controller: controller.warrantyController,
            scrollController: controller.warrantyEditorScrollController,
            focusNode: controller.warrantyEditorFocusNode,
          ),
        );
      },
    );
  }
}
