import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';
import '../../../../data/providers/repositories/providers/providers_repository.dart';

class ProvidersListController extends GetxController {
  final ProvidersRepository _repository = ProvidersRepository();
  final List<ProductModel> _data = <ProductModel>[];
  List<ProductModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  // final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get list => _list.toList();

  @override
  void onInit() {
    // _list.bindStream(_repository.getProductsFromFirebase());
    super.onInit();
  }

  Future<void> getDataVersion1() async {
    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['tab1View']);

    await _repository.getProvidersFromBackend();

    // Either<String, List<ProductModel>> response =
    //     await _repository.getProvidersFromBackend();
    // _isLoading = false;

    // response.fold((error) {
    //   _responseError = error;
    // }, (list) {
    //   _data.addAll(list);
    // });
    // update(['tab1View']);
  }
}
