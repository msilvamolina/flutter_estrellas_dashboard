import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';

class ProductEstrellas1Controller extends GetxController {
  late ProductModel product;
  @override
  void onInit() {
    product = Get.arguments as ProductModel;
    super.onInit();
  }
}
