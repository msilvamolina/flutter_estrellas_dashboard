import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_lite/product_lite.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/utils_image.dart';

enum Fields {
  name('name'),
  price('price'),
  suggestedPrice('suggestedPrice'),
  points('points'),
  stock('stock'),
  ;

  const Fields(this.text);
  final String text;
}

class CreateProductController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  ProviderModel? _providerModel;
  ProviderModel? get providerModel => _providerModel;

  ProviderWarehouseModel? _warehouseModel;
  ProviderWarehouseModel? get warehouseModel => _warehouseModel;

  // Estado de las categorías seleccionadas
  final RxList<String> multipleSelected = <String>[].obs;

  // Mapa de categorías
  final Map<String, int> categoryMap = {
    'Belleza': 1555,
    'Moda': 1958,
    'Electrónicos': 1995,
    'Belleza y Salud': 1959,
    'Calzado': 1960,
    'Cuidado Personal': 1961,
    'Hogar': 1962,
    'Cosméticos y Perfumería': 1963,
    'Accesorios': 1964,
    'Aseo y Bienestar': 1965,
  };

  // Datos generados de las categorías
  List<Map<String, Object>>? _categoriesJson;
  String? _categoriesIds;
  String? _categoriesNames;

  final QuillController descriptionController = QuillController(
    document: Document(),
    readOnly: false,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode descriptionEditorFocusNode = FocusNode();
  final ScrollController descriptionEditorScrollController = ScrollController();

  final QuillController detailsController = QuillController(
    document: Document(),
    readOnly: false,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode detailsEditorFocusNode = FocusNode();
  final ScrollController detailsEditorScrollController = ScrollController();

  final QuillController warrantyController = QuillController(
    document: Document(),
    readOnly: false,
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode warrantyEditorFocusNode = FocusNode();
  final ScrollController warrantyEditorScrollController = ScrollController();

  ProductFirebaseModel? product = Get.arguments;

  String productId = '';
  RxBool editMode = false.obs;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
          value: product?.name,
        ),
        Fields.price.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
          value: Utils.doubleToString(product?.price),
        ),
        Fields.suggestedPrice.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
          value: Utils.doubleToString(product?.suggestedPrice),
        ),
        Fields.points.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(2),
          ],
          value: Utils.doubleToString(product?.points),
        ),
        Fields.stock.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(1),
          ],
          value: Utils.doubleToString(product?.stock ?? 1),
        ),
      });

  @override
  Future<void> onInit() async {
    product = Get.arguments;
    editMode.value = product != null;

    if (product != null) {
      productId = product!.id;
      if (product!.categoriesNames != null) {
        multipleSelected.assignAll(
          product!.categoriesNames!.split(', ').toList(),
        );
      }
      if (product!.descriptionFormatted != null) {
        final descriptionDelta =
            Delta.fromJson(jsonDecode(product!.descriptionFormatted));
        descriptionController.document = Document.fromDelta(descriptionDelta);
      }

      if (product!.detailsFormatted != null) {
        final detailsDelta =
            Delta.fromJson(jsonDecode(product!.detailsFormatted));
        detailsController.document = Document.fromDelta(detailsDelta);
      }

      if (product!.warrantyFormatted != null) {
        final warrantyDelta =
            Delta.fromJson(jsonDecode(product!.warrantyFormatted));
        warrantyController.document = Document.fromDelta(warrantyDelta);
      }
    } else {
      print('holaaa');
      descriptionController.document = Document()..insert(0, '');
      detailsController.document = Document.fromJson([
        {
          "insert": "Marca: ",
          "attributes": {"bold": true}
        },
        {"insert": "Tesslux\n\n"},
        {
          "insert": "Capacidad: ",
          "attributes": {"bold": true}
        },
        {"insert": "1 Litro\n\n"},
        {
          "insert": "Color: ",
          "attributes": {"bold": true}
        },
        {"insert": "Plateado (silver)\n\n"},
        {
          "insert": "Dimensiones del producto: ",
          "attributes": {"bold": true}
        },
        {"insert": "12\"prof. x 8\"an. x 11,8\"al. pulgadas\n\n"},
        {
          "insert": "Características especiales: ",
          "attributes": {"bold": true}
        },
        {
          "insert":
              "Apagado automático, Programable, Función de limpieza automática, Espumador\n\n"
        },
        {
          "insert": "Tipo de cafetera: ",
          "attributes": {"bold": true}
        },
        {"insert": "Cafetera de espresso\n\n"},
        {
          "insert": "Descripción adicional: ",
          "attributes": {"bold": true}
        },
        {
          "insert":
              "Control de un botón: haz fácilmente espresso, capuchino o café con leche con solo presionar un botón.\n\n"
        }
      ]);
      warrantyController.document = Document.fromJson([
        {
          "insert": "Duración de la Garantía: ",
          "attributes": {"bold": true}
        },
        {
          "insert":
              "Este producto cuenta con una garantía limitada de 12 meses desde la fecha de compra.\n\n"
        },
        {
          "insert": "Cobertura: ",
          "attributes": {"bold": true}
        },
        {
          "insert":
              "La garantía cubre defectos de fabricación en materiales y mano de obra bajo condiciones normales de uso.\n\n"
        },
        {
          "insert": "Exclusiones: ",
          "attributes": {"bold": true}
        },
        {
          "insert":
              "No se cubren daños causados por mal uso, accidentes, desgaste natural, manipulación indebida o reparaciones no autorizadas.\n"
        }
      ]);
    }

    super.onInit();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    descriptionEditorScrollController.dispose();
    descriptionEditorFocusNode.dispose();

    detailsController.dispose();
    detailsEditorScrollController.dispose();
    detailsEditorFocusNode.dispose();

    warrantyController.dispose();
    warrantyEditorScrollController.dispose();
    warrantyEditorFocusNode.dispose();
    super.dispose();
  }

  void updateMultipleSelected(List<String> selected) {
    multipleSelected.assignAll(selected);
    update(
        ['categories']); // Actualiza las vistas relacionadas con las categorías
  }

  void buildCategories() {
    _categoriesJson = multipleSelected
        .map((name) => {'name': name, 'id': categoryMap[name]!})
        .toList();

    _categoriesIds =
        multipleSelected.map((name) => categoryMap[name]!).join(',');
    _categoriesNames = multipleSelected.join(', ');
  }

  Future<void> pickImage() async {
    _imagePath = await UtilsImage.pickImage();
    update(['view']);
  }

  Future<void> pickWarehouse() async {
    final result = await Get.toNamed(Routes.SELECT_PROVIDER);
    if (result != null) {
      _warehouseModel = result[0];
      _providerModel = result[1];
      update(['view']);
    }
  }

  Future<void> saveInFirebase({
    required ProductLiteModel product,
    required String imagePath,
  }) async {
    _mainController.setDropiDialog(false);

    _mainController.setDropiMessage('saveInFirebase');
    Either<String, Unit> response = await _repository.saveProductLiteInFirebase(
      product: product,
      imagePath: imagePath,
    );
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (_) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        Get.back(result: product);
      });
    });
  }

  String normalize(String text) {
    return text
        .replaceAll(RegExp(r'\s+'),
            ' ') // Sustituye espacios múltiples por un solo espacio
        .trim() // Elimina espacios al inicio y al final
        .toLowerCase(); // Convierte todo a minúsculas
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    buildCategories();

    if (_imagePath == null) {
      Get.snackbar('Error', "Tienes que elegir una imagen");
      return;
    }

    if (_warehouseModel == null) {
      Get.snackbar('Error', "Tienes que elegir una bodega");
      return;
    }

    if (_categoriesJson!.isEmpty) {
      Get.snackbar('Error', "Tienes que elegir al menos una categoría");
      return;
    }

    String descriptionDefault = '';
    final descriptionPlainText = descriptionController.document.toPlainText();

    bool descriptionNotModified =
        normalize(descriptionPlainText) == normalize(descriptionDefault);

    if (descriptionNotModified) {
      Get.snackbar('Error', "Revisa la descripción, no puede estar vacía");
      return;
    }
    String detailsDefault =
        'Marca: Tesslux\nCapacidad: 1 Litro\nColor: Plateado (silver)\nDimensiones del producto: 12"prof. x 8"an. x 11,8"al. pulgadas\nCaracterísticas especiales: Apagado automático, Programable, Función de limpieza automática, Espumador\nTipo de cafetera: Cafetera de espresso\nDescripción adicional: Control de un botón: haz fácilmente espresso, capuchino o café con leche con solo presionar un botón.';
    final detailsPlainText = detailsController.document.toPlainText();

    bool detailsNotModified =
        normalize(detailsPlainText) == normalize(detailsDefault);

    if (detailsNotModified) {
      Get.snackbar('Error', "Revisa los detalles, todavía tiene texto mockup");
      return;
    }

    String warrantyDefault =
        'Duración de la Garantía: Este producto cuenta con una garantía limitada de 12 meses desde la fecha de compra.\nCobertura: La garantía cubre defectos de fabricación en materiales y mano de obra bajo condiciones normales de uso.\nExclusiones: No se cubren daños causados por mal uso, accidentes, desgaste natural, manipulación indebida o reparaciones no autorizadas.';
    final warrantyPlainText = warrantyController.document.toPlainText();

    bool warrantyNotModified =
        normalize(warrantyPlainText) == normalize(warrantyDefault);

    if (warrantyNotModified) {
      Get.snackbar('Error', "Revisa las garantías, todavía tiene texto mockup");
      return;
    }

    final detailsJson =
        jsonEncode(detailsController.document.toDelta().toJson());

    final warrantyJson =
        jsonEncode(warrantyController.document.toDelta().toJson());

    final descriptionJson =
        jsonEncode(descriptionController.document.toDelta().toJson());

    String name = data[Fields.name.name].toString();
    String price = data[Fields.price.name].toString();
    String suggestedPrice = data[Fields.suggestedPrice.name].toString();
    String points = data[Fields.points.name].toString();
    String stock = data[Fields.stock.name].toString();

    int _stock = int.tryParse(stock) ?? 1;
    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    late Either<String, ProductLiteModel> response;
    if (editMode.value) {
      response = await _repository.updateProduct(
        id: productId,
        imagePath: _imagePath!,
        stock: stock,
        price: price,
        suggestedPrice: suggestedPrice,
        name: name,
        points: points,
        warehouseID: warehouseModel!.id,
        provider: providerModel!.id,
        description: descriptionPlainText,
        category: _categoriesIds ?? '',
      );
    } else {
      response = await _repository.createProduct(
        imagePath: _imagePath!,
        stock: stock,
        price: price,
        suggestedPrice: suggestedPrice,
        name: name,
        points: points,
        warehouseID: warehouseModel!.id,
        provider: providerModel!.id,
        description: descriptionPlainText,
        category: _categoriesIds ?? '',
      );
    }

    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (product) async {
      ProductLiteModel newProduct = product.copyWith(
        detailsPlainText: detailsPlainText.toString(),
        detailsFormatted: detailsJson,
        warrantyPlainText: warrantyPlainText.toString(),
        warrantyFormatted: warrantyJson,
        descriptionFormatted: descriptionJson,
        descriptionPlainText: descriptionPlainText,
        categories: _categoriesJson,
        categoriesIds: _categoriesIds,
        categoriesNames: _categoriesNames,
        stock: _stock,
      );
      _mainController.setDropiMessage('Success!');
      saveInFirebase(
        product: newProduct,
        imagePath: _imagePath!,
      );
    });

    // Either<String, ProductLiteModel> response = await _repository.updateProduct(
    //   id: '6773dbbc0813456f97488cbd',
    //   imagePath: _imagePath!,
    //   price: price,
    //   suggestedPrice: suggestedPrice,
    //   name: name,
    //   points: points,
    //   warehouseID: '6772b36ce54f5e0233020bc8',
    //   provider: providerModel!.id,
    // );

    // Either<String, Unit> response = await _repository.deleteProduct(
    //   externalId: '1425674',
    // );
  }
}
