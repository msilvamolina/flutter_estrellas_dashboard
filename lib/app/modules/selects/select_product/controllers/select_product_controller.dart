import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

class SelectProductController extends GetxController {
  final MainController _mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();

  final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  List<ProductFirebaseModel> get list => _list.toList();

  @override
  void onInit() {
    _list.bindStream(_repository.getProductsFromFirebase());

    super.onInit();
  }
}
