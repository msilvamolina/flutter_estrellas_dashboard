import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';

enum Fields {
  imageName('imageName');

  const Fields(this.name);
  final String name;
}

class ProductAddImageController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  // final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();
  late ProductFirebaseModel product;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.imageName.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
      });

  bool _loading = false;
  bool get loading => _loading;

  @override
  Future<void> onInit() async {
    product = Get.arguments as ProductFirebaseModel;

    super.onInit();
  }

  Future<CroppedFile?> cropImage(String imagePath) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imagePath,
      aspectRatio: const CropAspectRatio(ratioX: 800, ratioY: 800),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          rectWidth: 800,
          rectHeight: 800,
          title: 'Cropper',
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        WebUiSettings(
          context: Get.context!,
        ),
      ],
    );

    return croppedFile;
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String videoName = data[Fields.imageName.name].toString();
    String uuid = const Uuid().v4();
    String imageId = 'image-$uuid';

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await cropImage(image.path);
      if (croppedFile != null) {
        _mainController.showLoader();

        Either<String, Unit> response = await _repository.uploadImage(
          id: imageId,
          productId: product.id,
          path: croppedFile.path,
        );
        Get.back();
        response.fold((failure) {
          Get.snackbar("Error", failure);
          _loading = false;
          update(['view']);
        }, (_) {
          Get.back();
          Get.snackbar(videoName, "Guardado exitosamente");
        });
      }
    }
  }
}
