import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../../data/models/admin_user/admin_user_model.dart';
import '../../../../data/models/product/product/product.dart';
import '../../../../data/models/product/product_firebase/product_firebase_model.dart';
import '../../../../data/providers/repositories/products/products_repository.dart';
import '../../../../services/firebase_functions_services.dart';

class PermissionsController extends GetxController {
  final FirebaseFunctionsService _services = FirebaseFunctionsService();
  dynamic _listUsers;
  dynamic get listUsers => _listUsers;

  bool _loading = true;
  bool get loading => _loading;
  @override
  Future<void> onInit() async {
    _listUsers = await _services.getAllUsers();
    _loading = false;
    update(['view']);
    super.onInit();
  }

  @override
  void onReady() {
    // callSetUserPermission();
    super.onReady();
  }

  // Future<dynamic> getAllUsers() async {
  //   final functions = FirebaseFunctions.instance;

  //   // Configura la región si tus funciones están en una región específica
  //   // final functions = FirebaseFunctions.instanceFor(region: 'us-central1');

  //   // Usa el emulador solo si estás en desarrollo
  //   // functions.useFunctionsEmulator('127.0.0.1', 5001);

  //   // Llama a la función `getUsers`
  //   final HttpsCallable callable = functions.httpsCallable('getUsers');
  //   try {
  //     HttpsCallableResult<dynamic> response = await callable.call();

  //     // Log de depuración para verificar la respuesta
  //     log('Response data: ${response.data}');

  //     // Verifica si la respuesta contiene los usuarios
  //     if (response.data == null || !(response.data is List)) {
  //       throw Exception('Response does not contain a valid users list');
  //     }

  //     // Transforma los usuarios a tu modelo si es necesario
  //     final List<dynamic> users = response.data as List<dynamic>;

  //     // Aquí puedes mapear los usuarios a tu modelo, si tienes uno
  //     // final List<AdminUserModel> userList = users.map((user) => AdminUserModel.fromJson(user)).toList();

  //     return users;
  //   } on FirebaseFunctionsException catch (e) {
  //     log('FirebaseFunctionsException: ${e.code} - ${e.message}');
  //     rethrow;
  //   } catch (e) {
  //     log('General Exception: $e');
  //     rethrow;
  //   }
  // }

  Future<void> callSetUserPermission() async {
    // Inicializa Firebase si no lo has hecho ya
    // await Firebase.initializeApp();

    // Conecta a los emuladores locales
    final functions = FirebaseFunctions.instanceFor(region: 'us-central1');
    // functions.useFunctionsEmulator('127.0.0.1', 5001); // Conecta al emulador

    String userId = 'caaQyv2d3HPBwUJwP5P3RvNftE62';

    try {
      final result = await functions.httpsCallable('setUserPermission').call({
        'userId': userId,
        'permissions': {'superAdmin': true},
      });
      print(result.data); // "OK" en caso de éxito
    } catch (e) {
      print('Error: $e');
    }
  }
}
