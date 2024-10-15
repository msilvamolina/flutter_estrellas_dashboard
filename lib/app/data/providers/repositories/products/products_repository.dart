import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';

class ProductsRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Future<Either<String, List<ProductModel>>> getProductsFromBackend() async {
    String url = 'api/products/allProducts/?term=Protector';
    try {
      Response response = await services.get(url: url);

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }
      dynamic json = jsonDecode(response.body);
      List<dynamic> bodyList = json['data']['products'];

      if (bodyList.isEmpty) {
        return left('List Products is empty');
      }

      List<ProductModel> list = List<ProductModel>.generate(
        bodyList.length,
        (int index) => ProductModel.fromJson(bodyList[index]),
      );

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  Stream<List<ProductFirebaseModel>> getProductsFromFirebase() async* {
    try {
      Stream<QuerySnapshot> snapshots =
          _firebaseFirestore.collection('products').snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductFirebaseModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, Unit>> saveProductInFirebase({
    required ProductModel product,
  }) async {
    try {
      await _firebaseFirestore.collection('products').doc(product.id).set({
        'id': product.id,
        'externalId': product.externalId,
        'usefulId': product.usefulId,
        'name': product.name,
        'active': product.active,
        'points': product.points,
        'price': product.price,
        'suggestedPrice': product.suggestedPrice,
        'isPercentage': product.isPercentage,
        'type': product.type,
        'sku': product.sku,
        'category': {
          'id': product.category.id,
          'name': product.category.name,
        },
        'provider': {
          'id': product.provider.id,
          'name': product.provider.name,
          'avatarUrl': product.provider.avatarUrl
        },
        'thumbnail': product.thumbnail,
        'videoUrl': product.videoUrl,
        'createdAt': DateTime.tryParse(product.createdAt),
        'updatedAt': DateTime.tryParse(product.updatedAt),
        'uploadDate': product.uploadDate,
        'description': product.description,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> uploadImage({
    required String id,
    required String productId,
    required String path,
  }) async {
    Reference ref =
        _firebaseStorage.ref().child('products/$productId/images/').child(id);

    UploadTask uploadTask = ref.putFile(File(path));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    print('downloadUrl $downloadUrl');
    return right(unit);
  }
}
