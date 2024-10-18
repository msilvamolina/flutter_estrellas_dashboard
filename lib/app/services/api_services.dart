import 'dart:convert';

import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:get/instance_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

class ApiServices {
  static var client = http.Client();
  static String baseUrl = "dev-api.estrellas.app";

  Future<Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.https(baseUrl, url);
    Response response = await client.get(uri, headers: headers);

    return response;
  }

  Future<Response> getWithToken({
    required String url,
  }) async {
    MainController mainController = Get.find<MainController>();
    String? token;
    if (mainController.token != null) {
      token = mainController.token;
    } else {
      token = await getTokenFromServer();
    }

    Map<String, String>? headers = {'x-token': token ?? 'token'};
    var uri = Uri.https(baseUrl, url);
    Response response = await client.get(uri, headers: headers);

    return response;
  }

  Future<String?> getTokenFromServer() async {
    MainController mainController = Get.find<MainController>();

    try {
      Response response = await post(
        url: 'api/users/login/',
        body: {"user": '1144076614', "password": '1144076614'},
      );
      if (response.statusCode != 200) {
        return null;
      }
      dynamic json = jsonDecode(response.body);

      String? _token;
      if (json != null) {
        _token = json['data']['token'];
        if (_token != null) {
          mainController.setToken(_token);
        }
      }
      return _token;
    } catch (e) {
      return null;
    }
  }

  Future<Response> post({
    required String url,
    required Object? body,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.https(baseUrl, url);
    Response response = await client.post(uri, body: body, headers: headers);

    return response;
  }
}
