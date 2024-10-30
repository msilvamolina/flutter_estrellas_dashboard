import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

class ProductVariantsController extends GetxController {
  late ProductFirebaseModel product;
  final MainController _mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    super.onInit();
  }

  
}
