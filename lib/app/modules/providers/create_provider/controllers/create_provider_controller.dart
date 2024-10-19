import 'package:dartz/dartz.dart';
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

    Either<String, dynamic> response = await _repository.createProvider(
      avatarURL: _imagePath!,
      name: name,
      surname: surname,
      email: email,
      phone: phone,
      document: document,
      porcentage: porcentage,
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (_) {
      Get.back();
      Get.snackbar('Bien hecho!', "Guardado exitosamente");
    });
  }
  // await Future.delayed(Duration(seconds: 2), () {
  //   _mainController.setDropiMessage('Generando Token');
  // });

  // await Future.delayed(Duration(seconds: 4), () {
  //   _mainController.setDropiMessage('Conectando con provider/create');
  // });

  // await Future.delayed(Duration(seconds: 4), () {
  //   _mainController.setDropiMessage('Success!');
  // });

  // await Future.delayed(Duration(seconds: 2), () {
  //   _mainController.setDropiDialog(false);
  //   _mainController.setDropiMessage('Subiendo imagen');
  // });

  // await Future.delayed(Duration(seconds: 4), () {
  //   _mainController.setDropiMessage('Guardando datos en firebase');
  // });

  // await Future.delayed(Duration(seconds: 2), () {
  //   _mainController.setDropiDialogError(true,
  //       'Este proveedor ya existe en firebase, pero con otro nombre. El id del proveedor es: 67113828273871d1eaf51334');
  // });

  // await Future.delayed(Duration(seconds: 4), () {
  //   _mainController.setDropiMessage('Success!');
  // });

  // await Future.delayed(Duration(seconds: 2), () {
  //   Get.back();
  // });
  // String videoName = data[Fields.videoName.name].toString();
  // String uuid = const Uuid().v4();
  // String videoId = 'video-$uuid';

  // if (_productSelected == null) {
  //   _productsError = 'Selecciona un producto';
  //   update(['view']);
  //   return;
  // }

  // ProductFirebaseModel? _product = getProduct();

  // if (_product == null) {
  //   _productsError = 'Selecciona un producto válido';
  //   update(['view']);
  //   return;
  // }

  // final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
  // if (video != null) {
  //   _mainController.showLoader();

  //   Either<String, Unit> response = await _repository.uploadVideo(
  //     videoId: videoId,
  //     name: videoName,
  //     videoPath: video.path,
  //     product: _product,
  //   );
  //   Get.back();
  //   response.fold((failure) {
  //     Get.snackbar("Error", failure);
  //     _loading = false;
  //     update(['view']);
  //   }, (_) {
  //     Get.back();
  //     Get.snackbar(videoName, "Guardado exitosamente");
  //   });
  // }
}
