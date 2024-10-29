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

  void saveNewOrder() {
    for (int index = 0; index < _list.length; index++) {
      ProductImageModel? option = getProductByImage(_newOrderList[index]);

      if (option != null) {
        String imageId = option.id;
        print('imageId $imageId');
        print('index $index');
      }
    }
  }
}
