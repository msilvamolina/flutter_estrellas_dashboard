import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/providers/repositories/api_auth_repository.dart';
import 'package:estrellas_dashboard/app/services/api_services.dart';
import 'package:get/get.dart';

class TestGetProductsController extends GetxController {
  ApiRepository apiRepository = ApiRepository();
  String url = 'api/products/allProducts/?term=Protector';
  String baseUrl = ApiServices.baseUrl;

  dynamic _result;
  dynamic get result => _result;

  bool? _success;
  bool? get success => _success;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getInfo() async {
    _loading = true;
    _result = null;
    _success = null;
    update(['view']);

    Either<dynamic, dynamic> resultFold =
        await apiRepository.testApiEndpointGet(url: url);

    _loading = false;
    resultFold.fold(
      (response) {
        _success = false;
        _result = response;
        update(['view']);
      },
      (response) {
        _success = true;
        _result = response;
        update(['view']);
      },
    );
  }
}
