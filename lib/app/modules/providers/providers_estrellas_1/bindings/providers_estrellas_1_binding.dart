import 'package:get/get.dart';

import '../controllers/providers_estrellas_1_controller.dart';

class ProvidersEstrellas1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProvidersEstrellas1Controller>(
      () => ProvidersEstrellas1Controller(),
    );
  }
}
