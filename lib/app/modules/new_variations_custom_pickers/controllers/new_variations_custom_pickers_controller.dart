import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../data/providers/repositories/products/products_repository.dart';
import '../../../utils/utils_image.dart';
import '../widgets/add_attribute_dialog.dart';
import '../widgets/add_variation_dialog.dart';

class NewVariationsCustomPickersController extends GetxController {
  MainController _mainController = Get.find<MainController>();
  ProductsRepository _repository = ProductsRepository();

  final RxList<VariantAttributeModel> _list = <VariantAttributeModel>[].obs;
  List<VariantAttributeModel> get list => _list.toList();
  RxList<String> listAttributes = RxList();

  @override
  void onInit() {
    _list.bindStream(_repository.getAttributes());
    super.onInit();
  }

  Future<void> selectAttributes() async {
    List<String>? newList = await moreOptionsWithCheckboxes();

    if (newList != null) {
      listAttributes.clear();
      listAttributes.addAll(newList);
    }
  }

  Future<List<String>?> moreOptionsWithCheckboxes() async {
    Map<String, bool> attributes = {};

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
                      saveAttribute();
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

  Future<void> saveAttribute() async {
    String? name = await addAttribute();

    if (name != null) {
      saveAttributeInFirebase(name);
    }
  }

  Future<void> saveAttributeInFirebase(String name) async {
    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, dynamic> response =
        await _repository.saveAttributeInFirebase(name: name);

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
      });
    });
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
