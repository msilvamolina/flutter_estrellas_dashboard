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

  Future<void> getNewProducts() async {
    await _repository.getNewProducts();
  }

  Future<void> createOrder() async {
    await _repository.createOrder();
  }

  Future<void> createMultipleOrder() async {
    await _repository.createMultipleOrder();
  }

  Future<void> getOrders() async {
    await _repository.getOrders();
  }

  Future<void> getOrderById() async {
    await _repository.getOrderById('2859363');
  }

  Future<void> getMultipleOrderById() async {
    await _repository.getOrderById('2859364');
  }

  Future<void> getDepartments() async {
    await _repository.getDepartments();
  }

  Future<void> getCities() async {
    await _repository.getCities('49');
  }

  Future<void> getCategories() async {
    await _repository.getCategories();
  }
}
