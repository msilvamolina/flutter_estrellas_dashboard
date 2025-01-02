import 'dart:developer';

import 'package:get/get.dart';
import 'package:dartz/dartz.dart';

import '../../../app/controllers/main_controller.dart';
import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/providers/repositories/products/products_repository.dart';

class NewVariationsPickersController extends GetxController {
  late ProductFirebaseModel product;

  List<String> colorNames = []; // Solo nombres de colores
  List<String> sizeNames = []; // Solo nombres de tallas

  MainController _mainController =
      Get.find<MainController>(); // Controlador principal
  ProductsRepository _repository =
      ProductsRepository(); // Repositorio de productos

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    super.onInit();
  }

  void saveSelections(
      List<Map<String, String>>? tags, List<Map<String, String>>? colors) {
    // Generar las listas con solo los nombres
    sizeNames = tags?.map((tag) => tag['name'] ?? '').toList() ?? [];
    colorNames = colors?.map((color) => color['name'] ?? '').toList() ?? [];

    sendVariations();
  }

  Future<void> sendVariations() async {
    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Map<String, dynamic> payload = buildPayloadVariations();

    Either<String, dynamic> response =
        await _repository.updateProductVariations(
      requestBody: payload,
    );

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      _mainController.setDropiMessage('Success!');
      _mainController.setDropiDialog(false);
      _mainController.setDropiMessage('Guardando en Firebase');
      await _repository.saveCombinations(product: product);
      _mainController.setDropiMessage('Success!');

      Future.delayed(Duration(milliseconds: 200), () {
        Get.back();
        Get.back();
      });
    });
  }

  Map<String, dynamic> buildPayloadVariations() {
    // Validar listas antes de construir el payload
    filterLists();

    List<Map<String, dynamic>> attributes = [];
    List<Map<String, dynamic>> variations = [];

    if (colorNames.isNotEmpty) {
      attributes.add({
        "description": "Color",
        "values": colorNames,
      });
    }

    if (sizeNames.isNotEmpty) {
      attributes.add({
        "description": "Talla",
        "values": sizeNames,
      });
    }

    for (var color in colorNames) {
      for (var size in sizeNames) {
        variations.add({
          "attributes": [color, size],
          "cost": product.price,
          "value": product.suggestedPrice,
          "stock": 1,
          "points": product.points,
        });
      }
    }

    Map<String, dynamic> payload = {
      "id": product.id,
      "attributes": attributes,
      "variations": variations,
      "warehouseID": product.warehouseID,
    };

    return payload;
  }

  void filterLists() {
    // Aquí puedes agregar lógica adicional para filtrar o validar las listas
    colorNames = colorNames.where((name) => name.isNotEmpty).toList();
    sizeNames = sizeNames.where((name) => name.isNotEmpty).toList();
  }
}
