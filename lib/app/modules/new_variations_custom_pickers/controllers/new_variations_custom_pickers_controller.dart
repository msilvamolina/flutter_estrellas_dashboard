import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewVariationsCustomPickersController extends GetxController {
  late Map<String, bool> attributes;
  @override
  void onInit() {
    attributes = {
      'pepis2': false,
      'Nombre2': false,
      'Nombre3': false,
      'Nombre4': false,
    };
    super.onInit();
  }

  Future<void> selectAttributes() async {
    List<String> list = await moreOptionsWithCheckboxes();
    print('list $list');
  }

  Future<List<String>> moreOptionsWithCheckboxes() async {
    List<String> selectedAttributes = [];

    await showDialog<void>(
      context: Get.context!,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Selecciona atributos'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: attributes.keys.map((String name) {
                      return ListTile(
                        leading: Checkbox(
                          value: attributes[name],
                          onChanged: (bool? value) {
                            setState(() {
                              attributes[name] = value ?? false;
                            });
                          },
                        ),
                        title: Text(name),
                        onTap: () {
                          // Cambiar el estado del checkbox al hacer clic en el nombre
                          setState(() {
                            attributes[name] = !(attributes[name] ?? false);
                          });
                        },
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
                  ),
                ],
              ),
              actions: [
                ListTile(
                  onTap: () {
                    Get.back();
                    addAttribute();
                  },
                  leading: Icon(Icons.add_circle),
                  title: Text('Nuevo atributo'),
                ),
              ],
            );
          },
        );
      },
    );

    return selectedAttributes;
  }

  Future<void> addAttribute() async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController valueController = TextEditingController();

    await showDialog<String>(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nuevo atributo'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    hintText: 'Ingrese el nombre',
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: valueController,
                  decoration: InputDecoration(
                    labelText: 'Valor',
                    hintText: 'Ingrese el valor',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.color_lens),
                      onPressed: () async {
                        final selectedColor = await pickColor(context);
                        if (selectedColor != null) {
                          valueController.text = selectedColor;
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                final String name = nameController.text;
                final String value = valueController.text;

                print('Nombre: $name, Valor: $value');
                Get.back();
              },
              child: const Text('GUARDAR'),
            ),
          ],
        );
      },
    );
  }

  Future<String?> pickColor(BuildContext context) async {
    Color currentColor = Colors.red; // Color inicial por defecto
    String? selectedColorHex;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Selecciona un color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (Color color) {
                currentColor = color; // Actualiza el color seleccionado
              },
              showLabel: true, // Muestra el valor del color (Hex, RGB, etc.)
              pickerAreaHeightPercent: 0.8, // Ajusta el área del selector
            ),
          ),
          actions: [
            TextButton(
              onPressed: () =>
                  Navigator.of(context).pop(), // Cierra sin seleccionar
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                selectedColorHex =
                    '#${currentColor.value.toRadixString(16).substring(2).toUpperCase()}';
                Navigator.of(context).pop(); // Cierra con el color seleccionado
              },
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );

    return selectedColorHex;
  }

  Future<void> openGuideTour() async {
    await FeatureDiscovery.clearPreferences(Get.context!, [
      'feature_icon_button',
      'feature_floating_action',
    ]);
    FeatureDiscovery.discoverFeatures(
      Get.context!,
      ['feature_icon_button', 'feature_floating_action'],
    );
  }
}
