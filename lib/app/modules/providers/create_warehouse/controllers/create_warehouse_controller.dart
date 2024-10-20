import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/city/city/city.dart';
import 'package:estrellas_dashboard/app/data/models/city/department/department.dart';
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

  DepartmentModel? _departmentModel;
  DepartmentModel? get departmentModel => _departmentModel;

  CityModel? _cityModel;
  CityModel? get cityModel => _cityModel;

  late ProviderModel providerModel;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.address.name: FormControl<String>(
          validators: [
            Validators.required,
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
    providerModel = Get.arguments as ProviderModel;
    super.onInit();
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

  Future<void> pickCity() async {
    final result = await Get.toNamed(Routes.SELECT_DEPARTMENT);
    if (result != null) {
      _departmentModel = result[0];
      _cityModel = result[1];

      update(['view']);
    }
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (_cityModel == null) {
      Get.snackbar('Error', "Tienes que elegir una ciudad");
      return;
    }
    String name = data[Fields.name.name].toString();
    String address = data[Fields.address.name].toString();
    String phone = data[Fields.phone.name].toString();

    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, ProviderModel> response = await _repository.createWarehouse(
      name: name,
      city: _cityModel!.dropiId.toString(),
      address: address,
      phone: phone,
      provider: providerModel.id,
    );

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
