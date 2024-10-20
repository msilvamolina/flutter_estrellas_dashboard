import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/provider/provider/provider_model.dart';
import 'package:get/get.dart';

import '../../../../data/models/product/product/product.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';
import '../../../../data/providers/repositories/providers/providers_repository.dart';
import '../../../../routes/app_pages.dart';

class ProvidersListController extends GetxController {
  final ProvidersRepository _repository = ProvidersRepository();
  final List<ProviderModel> _data = <ProviderModel>[];
  List<ProviderModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  // final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get list => _list.toList();

  @override
  void onInit() {
    getDataVersion1();

    // _list.bindStream(_repository.getProductsFromFirebase());
    super.onInit();
  }

  @override
  void onReady() async {
    super.onInit();
  }

  Future<void> addProvider() async {
    final result = await Get.toNamed(Routes.CREATE_PROVIDER);
    if (result != null) {
      _data.insert(0, result);
    }
  }

  Future<void> getDataVersion1() async {
    _isLoading = true;
    _responseError = null;
    _data.clear();
    update(['view']);

    Either<String, List<ProviderModel>> response =
        await _repository.getProvidersFromBackend();
    _isLoading = false;

    response.fold((error) {
      _responseError = error;
    }, (list) {
      _data.addAll(list);
    });
    update(['view']);
  }
}
