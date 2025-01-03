import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

Future<String?> pickColor(BuildContext context, Color initialColor) async {
  Color currentColor = initialColor;
  TextEditingController hexController = TextEditingController(
    text: '#${currentColor.value.toRadixString(16).substring(2).toUpperCase()}',
  );

  String? selectedColorHex;

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('Selecciona un color'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ColorPicker(
                    pickerColor: currentColor,
                    onColorChanged: (Color color) {
                      setState(() {
                        currentColor = color;
                        hexController.text =
                            '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
                      });
                    },
                    enableAlpha: false,
                    showLabel: false,
                    pickerAreaHeightPercent: 0.8,
                  ),
                  TextFormField(
                    controller: hexController,
                    decoration: InputDecoration(
                      labelText: 'Código Hexadecimal',
                      hintText: '#RRGGBB',
                    ),
                    onChanged: (String value) {
                      if (value.startsWith('#') && value.length == 7) {
                        try {
                          final newColor = Color(
                            int.parse(value.substring(1), radix: 16) +
                                0xFF000000,
                          );
                          setState(() {
                            currentColor = newColor;
                          });
                        } catch (_) {
                          // Manejo de errores
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  selectedColorHex =
                      '#${currentColor.value.toRadixString(16).substring(2).toUpperCase()}';
                  Navigator.of(context).pop(); // Cierra el diálogo
                },
                child: const Text('Aceptar'),
              ),
            ],
          );
        },
      );
    },
  );

  return selectedColorHex;
}
