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

  dynamic _resultError;
  dynamic get resultError => _resultError;

  Future<void> getInfo() async {
    Either<dynamic, dynamic> resultFold =
        await apiRepository.testApiEndpointGet(url: url);

    resultFold.fold(
      (response) {
        _resultError = response;
        update(['result']);
      },
      (response) {
        _result = response;
        update(['result']);
      },
    );
  }
}
