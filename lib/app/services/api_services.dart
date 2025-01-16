import 'dart:convert';

import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:get/instance_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

import 'dart:io';

import 'package:path/path.dart';
import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'environment.dart';

class ApiServices {
  static var client = http.Client();
  static String baseUrlDev = "dev-api.estrellas.app";
  static String baseUrlProd = "api.estrellas.app";
  static String baseUrl =
      Environment.instance.currentEnv == Env.prod ? baseUrlProd : baseUrlDev;

  Future<Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    var uri = Uri.https(baseUrl, url);
    Response response = await client.get(uri, headers: headers);

    return response;
  }

  Future<String?> getToken() async {
    MainController mainController = Get.find<MainController>();
    mainController.setDropiMessage('getToken');

    String? token;
    if (mainController.token != null) {
      token = mainController.token;
    } else {
      token = await getTokenFromServer();
    }
    return token;
  }

  Future<Response> getWithToken({
    required String url,
  }) async {
    MainController mainController = Get.find<MainController>();

    String? token = await getToken();

    Map<String, String>? headers = {'x-token': token ?? 'token'};
    var uri = Uri.https(baseUrl, url);
    mainController.setDropiMessage('Conectando con $url');
    Response response = await client.get(uri, headers: headers);
    return response;
  }

  Future<Response> postWithToken({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    MainController mainController = Get.find<MainController>();

    String? token = await getToken();

    Map<String, String>? headers = {'x-token': token ?? 'token'};
    var uri = Uri.https(baseUrl, url);
    mainController.setDropiMessage('Conectando con $url');

    Response response = await client.post(uri, headers: headers, body: body);

    return response;
  }

  Future<Response> postJsonWithToken({
    required String url,
    required dynamic body,
  }) async {
    MainController mainController = Get.find<MainController>();

    String? token = await getToken();

    Map<String, String>? headers = {
      'x-token': token ?? 'token',
      "Content-Type": "application/json",
    };
    var uri = Uri.https(baseUrl, url);
    mainController.setDropiMessage('Conectando con $url');

    Response response = await client.post(uri, headers: headers, body: body);

    return response;
  }

  Future<Response> putWithToken({
    required String url,
    required dynamic body,
  }) async {
    MainController mainController = Get.find<MainController>();

    String? token = await getToken();

    Map<String, String>? headers = {
      'x-token': token ?? 'token',
      "Content-Type": "application/json",
    };
    var uri = Uri.https(baseUrl, url);
    mainController.setDropiMessage('Conectando con $url');

    Response response = await client.put(uri, headers: headers, body: body);

    return response;
  }

  Future<StreamedResponse> postWithFileAndToken({
    required String url,
    required Map<String, dynamic> fields,
    required String fieldImageName,
    required String fieldImagePath,
  }) async {
    MainController mainController = Get.find<MainController>();
    File imageFile = File(fieldImagePath);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();
    // string to uri
    var uri = Uri.https(baseUrl, url);
    // create multipart request
    var request = http.MultipartRequest("POST", uri);

    fields.forEach((key, value) {
      request.fields[key] = value;
    });

    request.headers['x-token'] = await getToken() ?? '';

    // multipart that takes file
    var multipartFile = http.MultipartFile(fieldImageName, stream, length,
        filename: basename(imageFile.path));

    mainController.setDropiMessage('Conectando con $url');
    request.files.add(multipartFile);

    StreamedResponse response = await request.send();
    return response;
  }

  Future<String?> getTokenFromServer() async {
    MainController mainController = Get.find<MainController>();
    mainController.setDropiMessage('getTokenFromServer');

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
