import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../../data/providers/repositories/api_auth_repository.dart';
import 'package:http/http.dart';

class TestLoginAppDropiController extends GetxController {
  ApiRepository apiRepository = ApiRepository();
  String url = 'api/users/login/';

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

    Map<String, String> body = {
      "email": 'email',
      "password": 'password',
    };

    Response? response =
        await apiRepository.testApiEndpointPost(url: url, body: body);
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
