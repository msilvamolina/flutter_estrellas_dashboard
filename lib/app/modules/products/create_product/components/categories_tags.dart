import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_product_controller.dart';

class CategoriesTags extends StatelessWidget {
  const CategoriesTags({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateProductController>(
      id: 'categories',
      builder: (controller) {
        return InlineChoice<String>(
          multiple: true,
          clearable: true,
          value: controller.multipleSelected,
          onChanged: (selected) => controller.updateMultipleSelected(selected),
          itemCount: controller.categoryMap.length,
          itemBuilder: (selection, i) {
            final categoryName = controller.categoryMap.keys.elementAt(i);
            return ChoiceChip(
              selected: selection.selected(categoryName),
              onSelected: selection.onSelected(categoryName),
              label: Text(categoryName),
            );
          },
          listBuilder: ChoiceList.createWrapped(
            spacing: 10,
            runSpacing: 10,
            padding: const EdgeInsets.symmetric(
              horizontal: 0,
              vertical: 0,
            ),
          ),
        );
      },
    );
  }
}
