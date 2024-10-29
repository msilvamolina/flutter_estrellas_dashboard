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
  final ProductsRepository _repository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();

  String? _imagePath;
  String? get imagePath => _imagePath;

  FormGroup buildForm(ProductVariantCombinationModel product) =>
      fb.group(<String, Object>{
        Fields.dropiId.name: FormControl<String>(
          value: product.dropiId,
          validators: [
            Validators.minLength(2),
          ],
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

  final count = 0.obs;
  @override
  void onInit() {
    productVariantCombination = Get.arguments as ProductVariantCombinationModel;
    super.onInit();
  }

  Future<void> sendForm(Map<String, Object?> data) async {
    String dropiId = data[Fields.dropiId.name].toString();
    String price = data[Fields.price.name].toString();
    String suggestedPrice = data[Fields.suggestedPrice.name].toString();
    String points = data[Fields.points.name].toString();
    String stock = data[Fields.stock.name].toString();

    print('dropiId: $dropiId');
    print('price: $price');
    print('suggestedPrice: $suggestedPrice');
    print('points: $points');
    print('stock: $stock');
  }
}
