import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_lite/product_lite.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/providers/providers_repository.dart';
import 'package:estrellas_dashboard/app/modules/providers/providers_warehouses/views/providers_warehouses_view.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/provider/warehouse/provider_warehouse_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/utils_image.dart';

enum Fields {
  name('name'),
  price('price'),
  suggestedPrice('suggestedPrice'),
  points('points'),
  ;

  const Fields(this.text);
  final String text;
}

class CreateProductController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  ProviderModel? _providerModel;
  ProviderModel? get providerModel => _providerModel;

  ProviderWarehouseModel? _warehouseModel;
  ProviderWarehouseModel? get warehouseModel => _warehouseModel;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.name.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.minLength(4),
          ],
        ),
        Fields.price.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
        Fields.suggestedPrice.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(4),
          ],
        ),
        Fields.points.name: FormControl<String>(
          validators: [
            Validators.required,
            Validators.number(),
            Validators.minLength(3),
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

  Future<void> pickWarehouse() async {
    final result = await Get.toNamed(Routes.SELECT_PROVIDER);
    if (result != null) {
      _warehouseModel = result[0];
      _providerModel = result[1];
      update(['view']);
    }
  }

  Future<void> saveInFirebase({
    required ProductLiteModel product,
    required String imagePath,
  }) async {
    _mainController.setDropiDialog(false);

    _mainController.setDropiMessage('saveInFirebase');
    Either<String, Unit> response = await _repository.saveProductLiteInFirebase(
      product: product,
      imagePath: imagePath,
    );
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (_) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        Get.back(result: product);
      });
    });
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    if (_imagePath == null) {
      Get.snackbar('Error', "Tienes que elegir una imagen");
      return;
    }

    if (_warehouseModel == null) {
      Get.snackbar('Error', "Tienes que elegir una bodega");
      return;
    }
    String name = data[Fields.name.name].toString();
    String price = data[Fields.price.name].toString();
    String suggestedPrice = data[Fields.suggestedPrice.name].toString();
    String points = data[Fields.points.name].toString();

    _mainController.setDropiDialog(true);
    _mainController.showDropiLoader();
    _mainController.setDropiMessage('Iniciando conexión');

    // Either<String, ProductLiteModel> response = await _repository.createProduct(
    //   imagePath: _imagePath!,
    //   price: price,
    //   suggestedPrice: suggestedPrice,
    //   name: name,
    //   points: points,
    //   warehouseID: warehouseModel!.id,
    //   provider: providerModel!.id,
    // );

    // Either<String, ProductLiteModel> response = await _repository.updateProduct(
    //   id: '6773dbbc0813456f97488cbd',
    //   imagePath: _imagePath!,
    //   price: price,
    //   suggestedPrice: suggestedPrice,
    //   name: name,
    //   points: points,
    //   warehouseID: '6772b36ce54f5e0233020bc8',
    //   provider: providerModel!.id,
    // );
    // response.fold((failure) {
    //   _mainController.setDropiDialogError(true, failure);
    // }, (product) async {
    //   _mainController.setDropiMessage('Success!');
    //   saveInFirebase(product: product, imagePath: _imagePath!);
    // });

    Either<String, Unit> response = await _repository.deleteProduct(
      externalId: '1425678',
    );
  }
}
