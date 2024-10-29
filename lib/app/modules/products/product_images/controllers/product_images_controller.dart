import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/models/product_image/product_image_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

class ProductImagesController extends GetxController {
  late ProductFirebaseModel product;
  final MainController _mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();

  final RxList<ProductImageModel> _list = <ProductImageModel>[].obs;
  List<ProductImageModel> get list => _list.toList();

  bool _listChanged = false;
  bool get listChanged => _listChanged;

  bool _buttonSaveLoading = false;
  bool get buttonSaveLoading => _buttonSaveLoading;

  List<String> _newOrderList = [];
  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getProductImages(productId: product.id));

    super.onInit();
  }

  void onListChanged(List<String> list) {
    _listChanged = true;
    _newOrderList.clear();
    _newOrderList.addAll(list);
    update(['list_changed']);
  }

  ProductImageModel? getProductByImage(String imageUrl) {
    ProductImageModel? option =
        _list.firstWhereOrNull((element) => element.imageUrl == imageUrl);

    return option;
  }

  Future<void> saveNewOrder() async {
    _buttonSaveLoading = true;
    update(['list_changed']);

    for (int index = 0; index < _list.length; index++) {
      ProductImageModel? option = getProductByImage(_newOrderList[index]);

      if (option != null) {
        await _repository.updateImageOrder(
          productId: product.id,
          imageId: option.id,
          order: index,
        );
      }
    }
    _buttonSaveLoading = false;
    update(['list_changed']);
    Get.snackbar('Guardado', 'nuevo orden guardado correctamente');
  }
}
