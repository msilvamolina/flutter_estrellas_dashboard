import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';

enum Fields {
  videoName('videoName');

  const Fields(this.name);
  final String name;
}

class CreateProviderController extends GetxController {
  // final VideosRepository _repository = VideosRepository();
  // final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  // final RxList<ProductFirebaseModel> _listProducts =
  //     <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get listProducts => _listProducts.toList();

  // String? _productSelected;
  // String? get productSelected => _productSelected;

  // String? _productsError;
  // String? get productsError => _productsError;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.videoName.name: FormControl<String>(
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
    // _listProducts.bindStream(_productsRepository.getProductsFromFirebase());

    super.onInit();
  }

  // void onProductSelected(String? value) {
  //   _productSelected = value;

  //   if (value != null) {
  //     _productsError = null;
  //   }
  //   update(['view']);
  // }

  // ProductFirebaseModel? getProduct() => listProducts.firstWhereOrNull(
  //     (ProductFirebaseModel element) => element.id == _productSelected);

  Future<void> sendForm(Map<String, Object?> data) async {
    _mainController.setDropiDialog(true);

    _mainController.showDropiLoader();

    _mainController.setDropiMessage('Iniciando conexión');

    await Future.delayed(Duration(seconds: 2), () {
      _mainController.setDropiMessage('Generando Token');
    });

    await Future.delayed(Duration(seconds: 4), () {
      _mainController.setDropiMessage('Conectando con provider/create');
    });

    await Future.delayed(Duration(seconds: 4), () {
      _mainController.setDropiDialogError(
          true, 'Este proveedor ya existe en la base de datos de dropi');
    });

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
}
