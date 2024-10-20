import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/utils_image.dart';

enum Fields {
  name('name'),
  city('city'),
  address('address'),
  phone('phone');

  const Fields(this.text);
  final String text;
}

class CreateWarehouseController extends GetxController {
  final ProvidersRepository _repository = ProvidersRepository();
  final MainController _mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.city.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.address.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.email,
            Validators.minLength(4),
          ],
        ),
        Fields.phone.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
      });

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  Future<void> pickImage() async {
    _imagePath = await UtilsImage.pickImage();
    update(['view']);
  }

  Future<void> saveInFirebase({
    required ProviderModel provider,
  }) async {
    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();

    _mainController.setDropiMessage('saveInFirebase');
    Either<String, Unit> response = await _repository.saveProviderInFirebase(
      provider: provider,
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (provider) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        Get.back();
      });
    });
  }

  Future<void> pickCity() async {
    final result = await Get.toNamed(Routes.SELECT_DEPARTMENT);
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (_imagePath == null) {
      Get.snackbar('Error', "Tienes que elegir una imagen");
      return;
    }
    String name = data[Fields.name.name].toString();
    String city = data[Fields.city.name].toString();
    String address = data[Fields.address.name].toString();
    String phone = data[Fields.phone.name].toString();

    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, dynamic> response = await _repository.createWarehouse(
      name: name,
      city: city,
      address: address,
      phone: phone,
      provider: 'sadadad',
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (provider) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        saveInFirebase(provider: provider);
      });
    });
  }
}
