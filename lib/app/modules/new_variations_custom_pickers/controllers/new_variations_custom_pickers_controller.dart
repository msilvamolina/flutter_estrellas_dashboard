import 'dart:io';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../utils/utils_image.dart';

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
    // openGuideTour();

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
        bool isImageValid = false;
        String? nameError;
        String? valueError;

        return StatefulBuilder(builder: (context, setState) {
          Color? getColorFromHex(String hex) {
            try {
              if (hex.startsWith('#') && hex.length == 7) {
                return Color(
                    int.parse(hex.substring(1), radix: 16) + 0xFF000000);
              }
            } catch (_) {
              return null; // Retornar null si el Hex no es válido
            }
            return null;
          }

          void openColorPicker() async {
            final initialColor =
                getColorFromHex(valueController.text) ?? Colors.red;
            final selectedColor = await pickColor(context, initialColor);
            if (selectedColor != null) {
              setState(() {
                isImageValid = false;
                valueError =
                    null; // Limpiar error cuando se selecciona un color válido
                valueController.text = selectedColor;
              });
            }
          }

          Future<bool> isValidImage(String path) async {
            try {
              final file = File(path);
              if (await file.exists()) {
                final fileExtension = file.path.split('.').last.toLowerCase();
                return ['png', 'jpg', 'jpeg', 'bmp', 'gif', 'webp']
                    .contains(fileExtension);
              }
            } catch (e) {
              // Handle errors if necessary
            }
            return false;
          }

          void validateInputs() {
            setState(() {
              nameError = nameController.text.isEmpty
                  ? 'El campo nombre no puede estar vacío'
                  : null;
              valueError = valueController.text.isEmpty
                  ? 'El campo valor no puede estar vacío'
                  : null;
            });
          }

          return AlertDialog(
            title: const Text('Nuevo atributo'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      hintText: 'Ingrese el nombre',
                      errorText: nameError, // Mostrar error si aplica
                    ),
                    onChanged: (value) {
                      setState(() {
                        nameError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      errorText: valueError, // Mostrar error si aplica
                      suffixIcon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (isImageValid)
                            GestureDetector(
                              onTap: () async {
                                String? _imagePath =
                                    await UtilsImage.pickImage();
                                if (_imagePath != null) {
                                  bool valid = await isValidImage(_imagePath);
                                  setState(() {
                                    isImageValid = valid;
                                    if (valid) {
                                      valueError =
                                          null; // Limpiar error cuando se selecciona una imagen válida
                                      valueController.text = _imagePath;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'La imagen seleccionada no es válida.'),
                                        ),
                                      );
                                    }
                                  });
                                }
                              },
                              child: Image.file(
                                File(valueController.text),
                                width: 22,
                              ),
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.image_rounded),
                              onPressed: () async {
                                String? _imagePath =
                                    await UtilsImage.pickImage();
                                if (_imagePath != null) {
                                  bool valid = await isValidImage(_imagePath);
                                  setState(() {
                                    isImageValid = valid;
                                    if (valid) {
                                      valueError =
                                          null; // Limpiar error cuando se selecciona una imagen válida
                                      valueController.text = _imagePath;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'La imagen seleccionada no es válida.'),
                                        ),
                                      );
                                    }
                                  });
                                }
                              },
                            ),
                          if (getColorFromHex(valueController.text) != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: openColorPicker,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor:
                                      getColorFromHex(valueController.text),
                                ),
                              ),
                            )
                          else
                            IconButton(
                              icon: const Icon(Icons.color_lens),
                              onPressed: openColorPicker,
                            ),
                        ],
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        valueError = null; // Limpiar error al escribir
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  validateInputs();
                  if (nameError == null && valueError == null) {
                    final String name = nameController.text;
                    final String value = valueController.text;
                    final bool isColor =
                        getColorFromHex(valueController.text) != null;
                    print(
                        'Nombre: $name, Valor: $value, isColor: $isColor, isImage: $isImageValid');
                    Get.back();
                  }
                },
                child: const Text('GUARDAR'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<String?> pickColor(BuildContext context, Color initialColor) async {
    Color currentColor = initialColor;
    TextEditingController hexController = TextEditingController(
      text:
          '#${currentColor.value.toRadixString(16).substring(2).toUpperCase()}',
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
