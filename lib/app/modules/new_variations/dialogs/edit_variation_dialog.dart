import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../themes/styles/typography.dart';
import '../../../utils/utils.dart';

Future<ProductVariantModel?> editVariationDialog(
    ProductVariantModel variation) async {
  final TextEditingController priceController =
      TextEditingController(text: Utils.doubleToString(variation.sale_price));
  final TextEditingController suggestedPriceController = TextEditingController(
      text: Utils.doubleToString(variation.suggested_price));
  final TextEditingController pointsController =
      TextEditingController(text: variation.points.toString());
  final TextEditingController stockController =
      TextEditingController(text: variation.stock.toString());

  final result = await showDialog<ProductVariantModel>(
    context: Get.context!,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          // Variables para manejar errores
          String? priceError;
          String? suggestedPriceError;
          String? pointsError;
          String? stockError;

          void validateInputs() {
            setState(() {
              // Validar precio (double)
              priceError = priceController.text.isEmpty
                  ? 'El precio no puede estar vacío'
                  : double.tryParse(priceController.text) == null
                      ? 'El precio debe ser un número válido'
                      : null;

              // Validar precio sugerido (double)
              suggestedPriceError = suggestedPriceController.text.isEmpty
                  ? 'El precio sugerido no puede estar vacío'
                  : double.tryParse(suggestedPriceController.text) == null
                      ? 'El precio sugerido debe ser un número válido'
                      : null;

              // Validar puntos (int)
              pointsError = pointsController.text.isEmpty
                  ? 'Los puntos no pueden estar vacíos'
                  : int.tryParse(pointsController.text) == null
                      ? 'Los puntos deben ser un número entero válido'
                      : null;

              // Validar stock (int)
              stockError = stockController.text.isEmpty
                  ? 'El stock no puede estar vacío'
                  : int.tryParse(stockController.text) == null
                      ? 'El stock debe ser un número entero válido'
                      : null;
            });
          }

          bool allInputsValid() {
            return priceError == null &&
                suggestedPriceError == null &&
                pointsError == null &&
                stockError == null;
          }

          return AlertDialog(
            title: const Text('Editar Variación'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo Precio
                  TextFormField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Precio',
                      errorText: priceError, // Mostrar error
                    ),
                    onChanged: (_) {
                      setState(() {
                        priceError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  // Campo Precio Sugerido
                  TextFormField(
                    controller: suggestedPriceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Precio Sugerido',
                      errorText: suggestedPriceError, // Mostrar error
                    ),
                    onChanged: (_) {
                      setState(() {
                        suggestedPriceError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  // Campo Puntos
                  TextFormField(
                    controller: pointsController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Puntos',
                      errorText: pointsError, // Mostrar error
                    ),
                    onChanged: (_) {
                      setState(() {
                        pointsError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                  const SizedBox(height: 8),
                  // Campo Stock
                  TextFormField(
                    controller: stockController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Stock',
                      errorText: stockError, // Mostrar error
                    ),
                    onChanged: (_) {
                      setState(() {
                        stockError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Get.back(result: null), // Cerrar el diálogo
                child: const Text('CANCELAR'),
              ),
              TextButton(
                onPressed: () {
                  validateInputs();
                  if (allInputsValid()) {
                    // Crear el nuevo modelo con copyWith
                    final updatedVariation = variation.copyWith(
                      sale_price: double.tryParse(priceController.text) ?? 0,
                      suggested_price:
                          double.tryParse(suggestedPriceController.text) ?? 0,
                      points: int.tryParse(pointsController.text) ?? 0,
                      stock: int.tryParse(stockController.text) ?? 0,
                    );
                    Get.back(result: updatedVariation); // Devuelve el modelo
                  }
                },
                child: const Text('GUARDAR'),
              ),
            ],
          );
        },
      );
    },
  );

  return result; // Devuelve el modelo actualizado o null si se cancela
}
