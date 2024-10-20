import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:estrellas_dashboard/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/providers/repositories/videos/videos_repository.dart';

enum Fields {
  videoName('videoName');

  const Fields(this.name);
  final String name;
}

class CreateVideoController extends GetxController {
  final VideosRepository _repository = VideosRepository();
  final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  final RxList<ProductFirebaseModel> _listProducts =
      <ProductFirebaseModel>[].obs;
  List<ProductFirebaseModel> get listProducts => _listProducts.toList();

  String? _productSelected;
  String? get productSelected => _productSelected;

  String? _productsError;
  String? get productsError => _productsError;

  String? _videoPath;
  String? get videoPath => _videoPath;

  String? _videoImagePath;
  String? get videoImagePath => _videoImagePath;

  ProductFirebaseModel? _productModel;
  ProductFirebaseModel? get productModel => _productModel;

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
    _listProducts.bindStream(_productsRepository.getProductsFromFirebase());

    super.onInit();
  }

  Future<void> pickProduct() async {
    final result = await Get.toNamed(Routes.SELECT_PRODUCT);
    _productModel = result;
    update(['view']);
  }

  Future<void> pickVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _videoPath = video.path;
      File videoFile = await _repository.getThumbnail(_videoPath!);
      _videoImagePath = videoFile.path;
      update(['view']);
    }
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String videoName = data[Fields.videoName.name].toString();
    String uuid = const Uuid().v4();
    String videoId = 'video-$uuid';

    if (_productModel == null) {
      Get.snackbar("Error", 'Selecciona un producto');
      update(['view']);
      return;
    }

    if (_videoImagePath == null) {
      Get.snackbar("Error", 'Selecciona un video');
      update(['view']);
      return;
    }

    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    Either<String, Unit> response = await _repository.uploadVideo(
      videoId: videoId,
      name: videoName,
      videoPath: _videoPath!,
      product: _productModel!,
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);

      _loading = false;
      update(['view']);
    }, (_) {
      _mainController.setDropiMessage('Success');

      Get.back();
    });
  }
}
