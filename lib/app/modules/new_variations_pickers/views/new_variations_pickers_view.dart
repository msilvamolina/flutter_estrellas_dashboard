import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:get/get.dart';

import '../../../themes/styles/typography.dart';
import '../controllers/new_variations_pickers_controller.dart';
import '../widgets/color_inline_picker.dart';
import '../widgets/tags_inline_picker.dart';

class NewVariationsPickersView extends GetView<NewVariationsPickersController> {
  const NewVariationsPickersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewVariationsPickersView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          MultipleInline(),
          Expanded(
            child: InlineGrid(),
          ),
          const SizedBox(height: 26),
        ],
      ),
    );
  }
}
