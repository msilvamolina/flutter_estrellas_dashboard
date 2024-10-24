import 'package:get/get.dart';

import '../controllers/product_estrellas_2_controller.dart';

class ProductEstrellas2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductEstrellas2Controller>(
      () => ProductEstrellas2Controller(),
    );
  }
}
