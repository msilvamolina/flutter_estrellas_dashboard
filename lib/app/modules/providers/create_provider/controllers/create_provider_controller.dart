import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../utils/utils_image.dart';

enum Fields {
  name('name'),
  email('email'),
  surname('surname'),
  phone('phone'),
  document('document'),
  porcentage('porcentage'),
  ;

  const Fields(this.text);
  final String text;
}

class CreateProviderController extends GetxController {
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
        Fields.surname.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.email.name: FormControl<String>(
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
        Fields.document.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
        Fields.porcentage.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(1),
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

    _mainController.setDropiMessage('saveInFirebase');
    Either<String, Unit> response = await _repository.saveProviderInFirebase(
      provider: provider,
    );
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (_) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        Get.back(result: provider);
      });
    });
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (_imagePath == null) {
      Get.snackbar('Error', "Tienes que elegir una imagen");
      return;
    }
    String name = data[Fields.name.name].toString();
    String surname = data[Fields.surname.name].toString();
    String email = data[Fields.email.name].toString();
    String phone = data[Fields.phone.name].toString();
    String document = data[Fields.document.name].toString();
    String porcentage = data[Fields.porcentage.name].toString();

    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    // Either<String, ProviderModel> response = await _repository.createProvider(
    //   avatarURL: _imagePath!,
    //   name: name,
    //   surname: surname,
    //   email: email,
    //   phone: phone,
    //   document: document,
    //   porcentage: porcentage,
    // );

    // Either<String, ProviderModel> response = await _repository.updateProvider(
    //   externalId: '369908',
    //   avatarURL: _imagePath!,
    //   name: name,
    //   surname: surname,
    //   email: email,
    //   phone: phone,
    //   document: document,
    //   porcentage: porcentage,
    // );

    // response.fold((failure) {
    //   _mainController.setDropiDialogError(true, failure);
    // }, (provider) async {
    //   _mainController.setDropiMessage('Success!');
    //   saveInFirebase(provider: provider);
    // });

    Either<String, Unit> response = await _repository.deleteProvider(
      id: '676d9230218dd3004b4b1f5f',
    );
  }
}
