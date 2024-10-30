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
  bool _listChanged = false;
  bool get listChanged => _listChanged;

  bool _buttonSaveLoading = false;
  bool get buttonSaveLoading => _buttonSaveLoading;

  List<String> _newOrderList = [];
  @override
  void onInit() {
    product = Get.arguments[0] as ProductFirebaseModel;
    typeSelected = Get.arguments[1] as VariantsTypes;
    _list.bindStream(_repository.getProductVariants(
      productId: product.id,
      type: typeSelected.name,
    ));
    super.onInit();
  }

  void addVariant() {
    Get.toNamed(
      Routes.PRODUCT_ADD_VARIANT,
      arguments: [product, typeSelected],
    );
  }

  void onListChanged(List<String> list) {
    _listChanged = true;
    _newOrderList.clear();
    _newOrderList.addAll(list);
    update(['list_changed']);
  }

  ProductVariantModel? getItemById(String id) {
    ProductVariantModel? option =
        _list.firstWhereOrNull((element) => element.id == id);

    return option;
  }

  Future<void> saveNewOrder() async {
    _buttonSaveLoading = true;
    update(['list_changed']);

    for (int index = 0; index < _list.length; index++) {
      ProductVariantModel? option = getItemById(_newOrderList[index]);

      if (option != null) {
        await _repository.updateVariantOrder(
          productId: product.id,
          variantId: option.id,
          order: index,
        );
      }
    }
    _buttonSaveLoading = false;
    update(['list_changed']);
    Get.snackbar('Guardado', 'nuevo orden guardado correctamente');
  }
}
