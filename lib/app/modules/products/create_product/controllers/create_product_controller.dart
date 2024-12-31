import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_lite/product_lite.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:estrellas_dashboard/app/modules/providers/providers_warehouses/views/providers_warehouses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/utils_image.dart';

enum Fields {
  name('name'),
  price('price'),
  suggestedPrice('suggestedPrice'),
  points('points'),
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

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.price.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
        Fields.suggestedPrice.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
        Fields.points.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(3),
          ],
        ),
      });

  final QuillController descriptionController = QuillController.basic();
  final FocusNode descriptionEditorFocusNode = FocusNode();
  final ScrollController descriptionEditorScrollController = ScrollController();

  final QuillController detailsController = QuillController.basic();
  final FocusNode detailsEditorFocusNode = FocusNode();
  final ScrollController detailsEditorScrollController = ScrollController();

  final QuillController warrantyController = QuillController.basic();
  final FocusNode warrantyEditorFocusNode = FocusNode();
  final ScrollController warrantyEditorScrollController = ScrollController();

  @override
  Future<void> onInit() async {
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

  Future<void> sendForm(Map<String, Object?> data) async {
    final json = jsonEncode(descriptionController.document.toDelta().toJson());

    log(json.toString());
    // if (_imagePath == null) {
    //   Get.snackbar('Error', "Tienes que elegir una imagen");
    //   return;
    // }

    // if (_warehouseModel == null) {
    //   Get.snackbar('Error', "Tienes que elegir una bodega");
    //   return;
    // }
    // String name = data[Fields.name.name].toString();
    // String price = data[Fields.price.name].toString();
    // String suggestedPrice = data[Fields.suggestedPrice.name].toString();
    // String points = data[Fields.points.name].toString();

    // _mainController.setDropiDialog(true);
    // _mainController.showDropiLoader();
    // _mainController.setDropiMessage('Iniciando conexión');

    // Either<String, ProductLiteModel> response = await _repository.createProduct(
    //   imagePath: _imagePath!,
    //   price: price,
    //   suggestedPrice: suggestedPrice,
    //   name: name,
    //   points: points,
    //   warehouseID: warehouseModel!.id,
    //   provider: providerModel!.id,
    // );

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
    // response.fold((failure) {
    //   _mainController.setDropiDialogError(true, failure);
    // }, (product) async {
    //   _mainController.setDropiMessage('Success!');
    //   saveInFirebase(product: product, imagePath: _imagePath!);
    // });

    // Either<String, Unit> response = await _repository.deleteProduct(
    //   externalId: '1425674',
    // );
  }
}
