import 'package:get/get.dart';

import '../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../data/models/product_variant/product_variant_model.dart';
import '../../../data/providers/repositories/products/products_repository.dart';

class NewVariationsController extends GetxController {
  late ProductFirebaseModel product;
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();
  ProductsRepository _repository =
      ProductsRepository(); // Repositorio de productos

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getAllProductVariants(
      productId: product.id,
    ));
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
