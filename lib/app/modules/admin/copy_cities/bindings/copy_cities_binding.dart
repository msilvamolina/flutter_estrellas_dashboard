import 'package:get/get.dart';

import '../controllers/copy_cities_controller.dart';

class CopyCitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CopyCitiesController>(
      () => CopyCitiesController(),
    );
  }
}
