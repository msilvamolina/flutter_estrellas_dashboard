import 'package:get/get.dart';

import '../controllers/product_estrellas_1_controller.dart';

class ProductEstrellas1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductEstrellas1Controller>(
      () => ProductEstrellas1Controller(),
    );
  }
}
