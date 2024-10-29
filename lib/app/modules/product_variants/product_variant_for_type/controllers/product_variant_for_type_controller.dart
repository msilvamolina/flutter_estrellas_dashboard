import 'package:estrellas_dashboard/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:get/get.dart';

import '../../../../data/models/product_variant/product_variant_model.dart';
import '../../../../routes/app_pages.dart';

enum VariantsTypes {
  color('color'),
  size('size');

  const VariantsTypes(this.text);
  final String text;
}

class ProductVariantForTypeController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();
  late VariantsTypes typeSelected;
  late ProductFirebaseModel product;
  final RxList<ProductVariantModel> _list = <ProductVariantModel>[].obs;
  List<ProductVariantModel> get list => _list.toList();

  @override
  void onInit() {
    product = Get.arguments[0] as ProductFirebaseModel;
    typeSelected = Get.arguments[1] as VariantsTypes;
    _list.bindStream(_repository.getProductVariants(
      productId: product.id,
      type: typeSelected.name,
    ));
    print('product $product');
    super.onInit();
  }

  void addVariant() {
    Get.toNamed(
      Routes.PRODUCT_ADD_VARIANT,
      arguments: [product, typeSelected],
    );
  }
}
