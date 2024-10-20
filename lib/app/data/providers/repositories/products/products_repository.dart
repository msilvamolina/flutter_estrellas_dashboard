import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_image/product_image_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_lite/product_lite.dart';
import '../../../models/product_variant/product_variant_model.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

  Future<Either<String, Unit>> saveProductLiteInFirebase({
    required ProductLiteModel product,
  }) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(product.id)
          .set(product.toDocument());
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, ProductLiteModel>> createProduct({
    required String name,
    required String price,
    required String suggestedPrice,
    required String points,
    required String warehouseID,
    required String provider,
    required String imagePath,
  }) async {
    String url = 'api/products/create';
    try {
      Map<String, dynamic> body = {
        'name': name,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'points': points,
        'warehouseID': warehouseID,
        'provider': provider,
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: body,
        fieldImageName: 'image',
        fieldImagePath: imagePath,
      );

      if (response.statusCode != 200) {
        return left('Error status code: ${response.statusCode}');
      }

      String responseBody =
          await response.stream.transform(utf8.decoder).join();

      dynamic json = jsonDecode(responseBody);
      bool ok = json['ok'] ?? false;

      if (!ok) {
        return left(json['data']);
      }

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(productModel);
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

  Stream<List<ProductImageModel>> getProductImages(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/images')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductImageModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProductVariantModel>> getProductVariants(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/variants')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantModel.fromDocument(doc))
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

  Future<Either<String, Unit>> saveImage({
    required String name,
    required String id,
    required String productId,
    required String path,
  }) async {
    try {
      print('path');
      print(path);
      // String? imageUrl =
      //     await uploadImage(id: id, productId: productId, path: path);

      // if (imageUrl != null) {
      //   await _firebaseFirestore
      //       .collection('products')
      //       .doc(productId)
      //       .collection('images')
      //       .doc(id)
      //       .set({
      //     'id': id,
      //     'name': name,
      //     'imageUrl': imageUrl,
      //     'createdAt': DateTime.now(),
      //   });
      //   return right(unit);
      // }
      return left('image null');
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<String?> uploadImage({
    required String id,
    required String productId,
    required String path,
  }) async {
    try {
      Reference ref =
          _firebaseStorage.ref().child('products/$productId/').child(id);

      UploadTask uploadTask = ref.putFile(File(path));
      TaskSnapshot snap = await uploadTask;
      String downloadUrl = await snap.ref.getDownloadURL();

      return downloadUrl;
    } on FirebaseException catch (e) {
      return null;
    }
  }

  Future<Either<String, Unit>> saveVariant({
    required String name,
    required String id,
    required String productId,
  }) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants')
          .doc(id)
          .set({
        'id': id,
        'name': name,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
