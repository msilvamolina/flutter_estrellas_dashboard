import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/variant_attributte/variant_attributte.dart';

Future<List<String>?> moreOptionsWithCheckboxes({
  required List<VariantAttributeModel> list,
  required Function() onSave,
  List<VariantAttributeModel>? listAttributes,
}) async {
  Map<String, bool> attributes = {};

  if (listAttributes != null) {
    for (VariantAttributeModel element in listAttributes) {
      attributes[element.name] = true;
    }
  }
  List<String>? result = await showDialog<List<String>?>(
    context: Get.context!,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            title: const Text('Selecciona atributos'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (VariantAttributeModel element in list)
                  ListTile(
                    leading: Checkbox(
                      value: attributes[element.name] ?? false,
                      onChanged: (bool? value) {
                        setState(() {
                          attributes[element.name] = value ?? false;
                        });
                      },
                    ),
                    title: Text(element.name),
                    onTap: () {
                      // Cambiar el estado del checkbox al hacer clic en el nombre
                      setState(() {
                        attributes[element.name] =
                            !(attributes[element.name] ?? false);
                      });
                    },
                    contentPadding: EdgeInsets.zero,
                  ),
                ListTile(
                  onTap: () {
                    Get.back();
                    onSave();
                  },
                  leading: Icon(Icons.add_circle),
                  title: Text('Nuevo atributo'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  List<String> selectedAttributes = attributes.entries
                      .where((entry) => entry.value)
                      .map((entry) => entry.key)
                      .toList();

                  Get.back(result: selectedAttributes); // Devuelve la lista
                },
                child: const Text('GUARDAR'),
              ),
            ],
          );
        },
      );
    },
  );
  return result;
}
