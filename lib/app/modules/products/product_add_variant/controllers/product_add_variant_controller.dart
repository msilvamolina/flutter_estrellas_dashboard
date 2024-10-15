import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:uuid/uuid.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

enum Fields {
  variantName('variantName');

  const Fields(this.name);
  final String name;
}

class ProductAddVariantController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  // final ProductsRepository _productsRepository = ProductsRepository();
  final MainController _mainController = Get.find<MainController>();
  late ProductFirebaseModel product;

  FormGroup buildForm() => fb.group(<String, Object>{
        Fields.variantName.name: FormControl<String>(
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
    String name = data[Fields.variantName.name].toString();
    String uuid = const Uuid().v4();
    String variantId = 'variant-$uuid';

    Either<String, Unit> response = await _repository.saveVariant(
      id: variantId,
      name: name,
      productId: product.id,
    );
    Get.back();
    response.fold((failure) {
      Get.snackbar("Error", failure);
      _loading = false;
      update(['view']);
    }, (_) {
      Get.back();
      Get.snackbar(name, "Guardada exitosamente");
    });
  }
}
