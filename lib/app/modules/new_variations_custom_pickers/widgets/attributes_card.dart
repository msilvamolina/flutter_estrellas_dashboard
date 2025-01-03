import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:estrellas_dashboard/app/themes/styles/typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_variations_custom_pickers_controller.dart';

class AttributesCard extends StatelessWidget {
  const AttributesCard({required this.attribute, super.key});

  final VariantAttributeModel attribute;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewVariationsCustomPickersController>(
      builder: (controller) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      attribute.name,
                      style: TypographyStyle.bodyBlackLarge,
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () => controller.saveVariant(attribute),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
