import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../../../data/providers/repositories/auth/products_repository.dart';

class ProductsController extends GetxController {
  ProductsRepository repository = ProductsRepository();
  List<ProductModel>? _data;
  List<ProductModel>? get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<void> getDataVersion1() async {
    _isLoading = true;
    update(['tab1View']);
    _data = await repository.getProductsFromBackend();
    _isLoading = false;
    update(['tab1View']);
  }

  void getDataVersion2() {
    print('getDataVersion2');
  }
}
