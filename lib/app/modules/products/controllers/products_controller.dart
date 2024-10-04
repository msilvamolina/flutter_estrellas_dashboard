import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../data/models/product/product.dart';
import '../../../data/providers/repositories/auth/products_repository.dart';

class ProductsController extends GetxController {
  ProductsRepository repository = ProductsRepository();
  final List<ProductModel> _data = <ProductModel>[];
  List<ProductModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  Future<void> getDataVersion1() async {
    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    Either<String, List<ProductModel>> response =
        await repository.getProductsFromBackend();
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['tab1View']);
  }

  void getDataVersion2() {
    print('getDataVersion2');
  }
}
