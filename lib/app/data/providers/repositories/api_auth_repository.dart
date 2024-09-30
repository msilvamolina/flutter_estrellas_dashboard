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
  }) async {
    try {
      Response response = await services.get(url: url);
      return response;
      // dynamic decode = json.decode(response.body);

      // if (response.statusCode == 200) {
      //   return right(response);
      // } else {
      //   return left(response);
      // }
    } catch (e) {
      return null;
    }
  }
}
