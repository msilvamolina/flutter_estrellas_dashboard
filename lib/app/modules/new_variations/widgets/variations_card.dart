import 'package:flutter/material.dart';
import '../../../data/models/product_variant/product_variant_model.dart';

class VariationsCard extends StatelessWidget {
  const VariationsCard({required this.variation, super.key});

  final ProductVariantModel variation;

  @override
  Widget build(BuildContext context) {
    // Controladores para los campos
    final TextEditingController idController =
        TextEditingController(text: variation.id);
    final TextEditingController pointsController =
        TextEditingController(text: variation.points.toString());
    final TextEditingController salePriceController =
        TextEditingController(text: variation.sale_price.toString());
    final TextEditingController skuController =
        TextEditingController(text: variation.sku.toString());
    final TextEditingController stockController =
        TextEditingController(text: variation.stock.toString());
    final TextEditingController suggestedPriceController =
        TextEditingController(text: variation.suggested_price.toString());

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Product Variant',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
              readOnly: true, // El ID no debe ser editable
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: pointsController,
              decoration: const InputDecoration(labelText: 'Points'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: salePriceController,
              decoration: const InputDecoration(labelText: 'Sale Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: skuController,
              decoration: const InputDecoration(labelText: 'SKU'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: stockController,
              decoration: const InputDecoration(labelText: 'Stock'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: suggestedPriceController,
              decoration: const InputDecoration(labelText: 'Suggested Price'),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            const Text(
              'Values:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ...variation.values.map((value) => ListTile(
                  title: Text('${value['attributeName']}: ${value['value']}'),
                  subtitle: Text('External ID: ${value['externalID']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      // Implementar edición de valores si es necesario
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
