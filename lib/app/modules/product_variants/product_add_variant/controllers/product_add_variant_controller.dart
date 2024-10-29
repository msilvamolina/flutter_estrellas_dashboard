import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/utils_image.dart';
import '../../product_variant_for_type/controllers/product_variant_for_type_controller.dart';

enum Fields {
  name('name'),
  label('label');

  const Fields(this.text);
  final String text;
}

class ProductAddVariantController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  // final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();
  late ProductFirebaseModel product;
  late VariantsTypes typeSelected;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.label.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(1),
          ],
        ),
      });

  bool _loading = false;
  bool get loading => _loading;
  String? _imagePath;
  String? get imagePath => _imagePath;

  Color? _selectedColor;
  Color? get selectedColor => _selectedColor;

  @override
  Future<void> onInit() async {
    product = Get.arguments[0] as ProductFirebaseModel;
    typeSelected = Get.arguments[1] as VariantsTypes;
    super.onInit();
  }

  Future<void> pickImage() async {
    _imagePath = await UtilsImage.pickImage();
    update(['view']);
  }

  void onColorChange(Color color) {
    _selectedColor = color;
    update(['view']);
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String name = data[Fields.name.name].toString();
    String label = data[Fields.label.name].toString();
    String type = typeSelected.name;
    int? color;

    if (_selectedColor != null) {
      color = Utils.colorToInt(_selectedColor!);
    }

    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();

    _mainController.setDropiMessage('saveInFirebase');

    Either<String, Unit> response = await _repository.saveVariant(
      name: name,
      label: label,
      type: type,
      color: color,
      productId: product.id,
      imageUrl: _imagePath,
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);

      _loading = false;

      update(['view']);
    }, (_) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
      });
    });
  }
}
