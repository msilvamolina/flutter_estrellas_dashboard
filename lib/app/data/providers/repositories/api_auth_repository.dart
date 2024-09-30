import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../app/controllers/user_controller.dart';
import '../../../services/api_services.dart';

class ApiRepository {
  ApiServices services = ApiServices();
  UserController userController = Get.find<UserController>();

  Future<Response?> testApiEndpointGet({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      Response response = await services.get(headers: headers, url: url);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<Response?> testApiEndpointPost({
    required String url,
    required Map<String, String> body,
    Map<String, String>? headers,
  }) async {
    try {
      Response response =
          await services.post(headers: headers, url: url, body: body);
      return response;
    } catch (e) {
      return null;
    }
  }
}
