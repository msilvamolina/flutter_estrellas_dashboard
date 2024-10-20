import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/products/products_repository.dart';
import 'package:get/get.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../data/models/product/product/product.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';

class ProductEstrellas1Controller extends GetxController {
  late ProductModel product;
  final MainController _mainController = Get.find<MainController>();
  final ProductsRepository _repository = ProductsRepository();
  @override
  void onInit() {
    product = Get.arguments as ProductModel;
    super.onInit();
  }

  Future<void> copyToFirebase() async {
    _mainController.showLoader();

    Either<String, Unit> response = await _repository.saveProductInFirebase(
      product: product,
    );
    Get.back();
    response.fold((failure) {
      Get.snackbar("Error", failure);
      update(['view']);
    }, (_) {
      Get.back();
      Get.snackbar(product.name ?? '', "Guardado exitosamente");
    });
  }
}
