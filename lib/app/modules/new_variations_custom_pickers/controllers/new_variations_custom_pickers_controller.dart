import 'dart:io';

import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../utils/utils_image.dart';
import '../widgets/add_attribute_dialog.dart';
import '../widgets/add_variation_dialog.dart';

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
                    saveAttribute();
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

  Future<void> saveAttribute() async {
    String? name = await addAttribute();

    if (name != null) {
      print('name: $name');
    }
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
