import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:flutter/material.dart';

class AttributesCard extends StatelessWidget {
  const AttributesCard({required this.attribute, super.key});

  final VariantAttributeModel attribute;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(attribute.toString()),
      ),
    );
  }
}
