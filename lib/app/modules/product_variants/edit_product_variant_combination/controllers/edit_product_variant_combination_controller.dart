import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:estrellas_dashboard/app/utils/money_amount.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product_variant_combination/product_variant_combination_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

enum Fields {
  dropiId('dropiId'),
  stock('stock'),
  price('price'),
  suggestedPrice('suggestedPrice'),
  points('points'),
  ;

  const Fields(this.text);
  final String text;
}

class EditProductVariantCombinationController extends GetxController {
  late ProductVariantCombinationModel productVariantCombination;
  late ProductFirebaseModel product;
  final ProductsRepository _repository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  FormGroup buildForm(ProductVariantCombinationModel product) {
    String dropiId = '';
    if (product.dropiId == 'null') {
      dropiId = '';
    }
    return fb.group(<String, Object>{
      Fields.dropiId.name: FormControl<String>(
        value: dropiId,
        validators: [],
      ),
      Fields.price.name: FormControl<String>(
        value: MoneyAmount.remove0(product.price ?? 0),
        validators: [
          Validators.required,
          Validators.number(),
          Validators.minLength(4),
        ],
      ),
      Fields.suggestedPrice.name: FormControl<String>(
        value: MoneyAmount.remove0(product.suggestedPrice ?? 0),
        validators: [
          Validators.required,
          Validators.number(),
          Validators.minLength(4),
        ],
      ),
      Fields.points.name: FormControl<String>(
        value: product.points.toString(),
        validators: [
          Validators.required,
          Validators.number(),
          Validators.minLength(3),
        ],
      ),
      Fields.stock.name: FormControl<String>(
        value: product.stock.toString(),
        validators: [
          Validators.required,
          Validators.minLength(1),
        ],
      ),
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    productVariantCombination =
        Get.arguments[0] as ProductVariantCombinationModel;
    product = Get.arguments[1] as ProductFirebaseModel;
    super.onInit();
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String dropiId = data[Fields.dropiId.name].toString();
    String price = data[Fields.price.name].toString();
    String suggestedPrice = data[Fields.suggestedPrice.name].toString();
    String points = data[Fields.points.name].toString();
    String stock = data[Fields.stock.name].toString();

    _mainController.setDropiDialog(false);
    _mainController.showDropiLoader();

    _mainController.setDropiMessage('saveInFirebase');

    double _price = double.tryParse(price) ?? 0;
    double _suggestedPrice = double.tryParse(suggestedPrice) ?? 0;
    int _points = int.tryParse(points) ?? 0;
    int _stock = int.tryParse(stock) ?? 0;

    Either<String, Unit> response = await _repository.updateVariantComination(
      dropiId: dropiId,
      price: _price,
      suggestedPrice: _suggestedPrice,
      points: _points,
      stock: _stock,
      variationCombinationId: productVariantCombination.id,
      productId: product.id,
    );
    Get.back();
    response.fold((failure) {
      _mainController.setDropiDialogError(true, failure);
    }, (_) async {
      _mainController.setDropiMessage('Success!');
      await Future.delayed(const Duration(seconds: 1), () {
        Get.back();
      });
    });
  }
}
