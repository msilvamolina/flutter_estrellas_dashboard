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
  // final List<ProviderModel> _data = <ProviderModel>[];
  // List<ProviderModel> get data => _data;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  String? _responseError;
  String? get responseError => _responseError;

  // final RxList<ProductFirebaseModel> _list = <ProductFirebaseModel>[].obs;
  // List<ProductFirebaseModel> get list => _list.toList();

  final RxList<ProviderModel> _list = <ProviderModel>[].obs;
  List<ProviderModel> get list => _list.toList();

  @override
  void onInit() {
    // getData();

    _list.bindStream(_repository.getProviersFromFirebase());
    super.onInit();
  }

  @override
  void onReady() async {
    super.onInit();
  }

  Future<void> addProvider() async {
    await Get.toNamed(Routes.CREATE_PROVIDER);
    // await getData();
  }

  // Future<void> getData() async {
  //   Either<String, List<ProviderModel>> response =
  //       await _repository.getProvidersFromBackend();
  //   _isLoading = false;

  //   response.fold((error) {
  //     _responseError = error;
  //   }, (list) {
  //     _data.clear();
  //     _data.addAll(list);
  //   });
  //   update(['view']);
  // }
}
