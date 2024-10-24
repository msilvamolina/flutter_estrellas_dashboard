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

  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    _list.bindStream(_repository.getProductImages(productId: product.id));

    super.onInit();
  }
}
