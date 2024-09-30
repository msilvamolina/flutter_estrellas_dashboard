import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../app/controllers/user_controller.dart';
import '../../../services/api_services.dart';

class ApiRepository {
  ApiServices services = ApiServices();
  UserController userController = Get.find<UserController>();

  Future<Either<dynamic, dynamic>> testApiEndpointGet({
    required String url,
  }) async {
    try {
      // Map<String, String> body = {
      //   "email": email,
      //   "password": password,
      // };
      Response response = await services.get(url: url);
      dynamic decode = json.decode(response.body);

      if (response.statusCode == 200) {
        return right(decode);
      } else {
        return left(decode);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
