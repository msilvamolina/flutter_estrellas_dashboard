import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product/product.dart';

class ProvidersRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Future<Either<String, dynamic>> getProvidersFromBackend() async {
    String url = 'api/provider/get-all';
    print('getProvidersFromBackend');
    try {
      Response response = await services.getWithToken(url: url);

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }
      dynamic json = jsonDecode(response.body);
      log(json.toString());
      List<dynamic> bodyList = json['data']['providers'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
