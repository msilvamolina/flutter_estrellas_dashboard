import 'package:get/get.dart';

import '../../../../data/providers/repositories/products/products_repository.dart';

class CreateProductController extends GetxController {
  final ProductsRepository _repository = ProductsRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  Future<void> createProduct() async {
    await _repository.createProduct();
  }

  Future<void> createProvider() async {
    await _repository.createProvider();
  }

  Future<void> getProviders() async {
    await _repository.getProviders();
  }
}
