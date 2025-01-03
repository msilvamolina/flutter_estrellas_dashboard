import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<String?> addAttribute() async {
  final TextEditingController nameController = TextEditingController();
  String? nameError;

  final result = await showDialog<String>(
    context: Get.context!,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          void validateInputs() {
            setState(() {
              nameError = nameController.text.isEmpty
                  ? 'Ingresá un nombre para el atributo'
                  : null;
            });
          }

          return AlertDialog(
            title: const Text('Nuevo atributo'),
            content: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                hintText: 'Ingrese el nombre',
                errorText: nameError,
              ),
              onChanged: (value) {
                setState(() {
                  nameError = null; // Limpiar error al escribir
                });
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  validateInputs();
                  if (nameError == null) {
                    final String name = nameController.text;
                    Get.back(result: name); // Devuelve el nombre ingresado
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

  return result; // Devuelve un string vacío si el resultado es null
}
