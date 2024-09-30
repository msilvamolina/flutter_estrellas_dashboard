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
  }) async {
    Map<String, String> headers = {
      // "token": userController.token ?? '',
    };
    var uri = Uri.https(baseUrl, url);
    Response response = await client.get(uri, headers: headers);

    return response;
  }

  Future<Response> post({
    required String url,
    required Map<String, String> body,
  }) async {
    Map<String, String> headers = {
      // "token": userController.token ?? '',
    };
    var uri = Uri.https(baseUrl, url);
    Response response = await client.post(uri, body: body, headers: headers);

    return response;
  }
}
