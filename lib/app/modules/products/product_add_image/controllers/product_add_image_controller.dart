import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
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
  // final VideosRepository _repository = VideosRepository();
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

  Future<void> sendForm(Map<String, Object?> data) async {
    String videoName = data[Fields.imageName.name].toString();
    String uuid = const Uuid().v4();
    String videoId = 'image-$uuid';

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

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      // _mainController.showLoader();

      // Either<String, Unit> response = await _repository.uploadVideo(
      //   videoId: videoId,
      //   name: videoName,
      //   videoPath: video.path,
      //   product: _product,
      // );
      // Get.back();
      // response.fold((failure) {
      //   Get.snackbar("Error", failure);
      //   _loading = false;
      //   update(['view']);
      // }, (_) {
      //   Get.back();
      //   Get.snackbar(videoName, "Guardado exitosamente");
      // });
    }
  }
}
