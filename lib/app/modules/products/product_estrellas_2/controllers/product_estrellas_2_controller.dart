import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product_firebase/product_firebase_model.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product/product.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

class ProductEstrellas2Controller extends GetxController {
  late ProductFirebaseModel product;
  final MainController _mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();
  @override
  void onInit() {
    product = Get.arguments as ProductFirebaseModel;
    super.onInit();
  }
}
