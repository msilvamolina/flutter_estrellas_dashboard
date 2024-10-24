import 'dart:convert';

import 'package:estrellas_dashboard/app/data/providers/repositories/api_test_repository.dart';
import 'package:estrellas_dashboard/app/services/api_services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get/get.dart';
import 'package:http/http.dart';

class TestGetProductsController extends GetxController {
  ApiTestRepository apiRepository = ApiTestRepository();
  String url = 'api/products/allProducts/?term=Protector';

  dynamic _result;
  dynamic get result => _result;

  bool? _success;
  bool? get success => _success;

  int? _statusCode;
  int? get statusCode => _statusCode;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> getInfo() async {
    _loading = true;
    _result = null;
    _success = null;
    update(['view']);

    Response? response = await apiRepository.testApiEndpointGet(url: url);
    _loading = false;

    if (response != null) {
      dynamic decode = json.decode(response.body);
      _result = decode;
      _success = response.statusCode == 200;
      _statusCode = response.statusCode;
      update(['view']);
    }
  }
}
