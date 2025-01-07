import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';

import '../data/models/admin_user/admin_user_model.dart';

class FirebaseFunctionsService {
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Future<List<AdminUserModel>> getAllUsers() async {
    HttpsCallable callable = _functions.httpsCallable('getUsers');
    try {
      HttpsCallableResult<dynamic> response = await callable.call();

      List<dynamic> users = response.data as List<dynamic>;

      if (users.isEmpty) {
        throw Exception('users empty');
      }

      List<AdminUserModel> list =
          users.map((dynamic val) => AdminUserModel.fromJson(val)).toList();

      return list;
    } on FirebaseFunctionsException catch (e) {
      log('message: ${e.message}');
      rethrow;
    } on Exception catch (e) {
      log('message: ${e.toString()}');
      rethrow;
    }
  }

  Future<Either<String, Unit>> setUserClaims(
    String userUID,
    dynamic permissions,
  ) async {
    final HttpsCallable callable =
        _functions.httpsCallable('setUserPermission');
    try {
      await callable.call({
        'userId': userUID,
        'permissions': permissions,
      });

      return right(unit); // Devuelve éxito si todo va bien
    } on FirebaseFunctionsException catch (e) {
      log('FirebaseFunctionsException: ${e.message}'); // Loguea el error para depuración
      return left(e.message ?? 'FirebaseFunctionsException');
    } on Exception catch (e) {
      log('General Exception: ${e.toString()}'); // Loguea errores genéricos
      return left(e.toString());
    }
  }
}
