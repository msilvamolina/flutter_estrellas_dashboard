import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
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

  void onProductSelected(String? value) {
    _productSelected = value;

    print('value=> $value');
    update(['view']);
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String videoName = data[Fields.videoName.name].toString();
    String uuid = const Uuid().v4();
    String videoId = 'video-$uuid';

    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      _mainController.showLoader();

      Either<String, Unit> response = await _repository.uploadVideo(
        videoId: videoId,
        name: videoName,
        videoPath: video.path,
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
