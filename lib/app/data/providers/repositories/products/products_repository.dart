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

  Future<Either<String, dynamic>> getProviders() async {
    String url = 'api/provider/get-all';
    print('getProviders() ');
    try {
      dynamic headers = {
        'x-token':
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2NDYzYjA2YTc0MjBiZjRkYTRjMWVjZWYiLCJpYXQiOjE3MjkwOTQ0NTcsImV4cCI6MTcyOTE4MDg1N30.p10lSMsSXAinWx1BqfFfPAeD_XS2RZL9NKoUQnrQBZc",
      };
      Response response = await services.get(url: url, headers: headers);

      // if (response.statusCode != 200) {
      //   return left('Error status code: ${response.statusCode}');
      // }
      dynamic json = jsonDecode(response.body);
      // List<dynamic> bodyList = json['data']['providers'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      print(json.toString());
      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right(unit);
    } catch (e) {
      print('error: e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> getNewProducts() async {
    String url = 'api/products/get-all';
    print('getNewProducts() ');
    try {
      dynamic headers = {
        'x-token':
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2NDYzYjA2YTc0MjBiZjRkYTRjMWVjZWYiLCJpYXQiOjE3MjkwOTQ0NTcsImV4cCI6MTcyOTE4MDg1N30.p10lSMsSXAinWx1BqfFfPAeD_XS2RZL9NKoUQnrQBZc",
      };
      Response response = await services.get(url: url, headers: headers);

      // if (response.statusCode != 200) {
      //   return left('Error status code: ${response.statusCode}');
      // }
      dynamic json = jsonDecode(response.body);
      // List<dynamic> bodyList = json['data']['providers'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      print(json.toString());
      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right(unit);
    } catch (e) {
      print('error: e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> createOrder() async {
    String url = 'api/orders/create-order';
    print('getProviders() ');
    try {
      dynamic headers = {
        'x-token':
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2NDYzYjA2YTc0MjBiZjRkYTRjMWVjZWYiLCJpYXQiOjE3MjkwOTQ0NTcsImV4cCI6MTcyOTE4MDg1N30.p10lSMsSXAinWx1BqfFfPAeD_XS2RZL9NKoUQnrQBZc",
      };

      Map<String, String> body = {
        "city_id": "1222",
        "client_direction": "Cra 01 #12-34 B/ San Vicente",
        "client_email": "dianasierra@dropi.co",
        "client_name": "Diana Patricia",
        "client_notes": "Notica",
        "client_phone": "3127559567",
        "client_quantity": '1',
        "client_surname": "Diana Patricia",
        "department_id": "81",
        "product_id": "66e5d4df6c9cc90fce0b1a57",
        "user_id": "6463b06a7420bf4da4c1ecef",
        "variation_id": 'null',
      };
      Response response =
          await services.post(url: url, headers: headers, body: body);

      // if (response.statusCode != 200) {
      //   return left('Error status code: ${response.statusCode}');
      // }
      dynamic json = jsonDecode(response.body);
      // List<dynamic> bodyList = json['data']['providers'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      print(json.toString());
      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right(unit);
    } catch (e) {
      print('error: e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> createProduct() async {
    String baseUrl = "dev-api.estrellas.app";

    String url = 'api/products/create';
    try {
      print('createProduct');
      String imagePath =
          '/Users/martin/Library/Developer/CoreSimulator/Devices/4A18C68A-D8DF-4E65-BBF8-2F43BF34682D/data/Containers/Data/Application/262D9AF5-C934-4BFA-B5C0-327DBE17E49F/tmp/image_cropper_877471C9-F912-461D-8E29-6D9546B2861C-83396-0000039EC181E6F8.jpg';
      File imageFile = File(imagePath);

      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();

      // string to uri
      var uri = Uri.https(baseUrl, url);

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      request.fields['provider'] = '66b67ce444bf72694de06abc';
      request.fields['name'] = 'Producto de prueba';
      request.fields['price'] = '1234';
      request.fields['suggestedPrice'] = '1111';
      request.fields['points'] = '991';
      // multipart that takes file
      var multipartFile = new http.MultipartFile('image', stream, length,
          filename: basename(imageFile.path));

      // add file to multipart
      request.files.add(multipartFile);

      // send
      var response = await request.send();
      print(response.statusCode);

      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      // Response response = await services.post(
      //   url: url,
      //   headers: headers,
      //   body: jsonEncode(body),
      // );

      // if (response.statusCode != 200) {
      //   return left('Error status code: ${response.statusCode}');
      // }
      // dynamic json = jsonDecode(response.body);

      log(json.toString());

      // List<dynamic> bodyList = json['data']['products'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right('list');
    } catch (e) {
      print('error $e');
      return left(e.toString());
    }
  }

  Future<Either<String, dynamic>> createProvider() async {
    String baseUrl = "dev-api.estrellas.app";
    // String baseUrl = "41e8-186-85-250-3.ngrok-free.app";

    String url = 'api/provider/create';
    try {
      print('createProvider');
      String imagePath =
          '/Users/martin/Library/Developer/CoreSimulator/Devices/4A18C68A-D8DF-4E65-BBF8-2F43BF34682D/data/Containers/Data/Application/262D9AF5-C934-4BFA-B5C0-327DBE17E49F/tmp/image_cropper_877471C9-F912-461D-8E29-6D9546B2861C-83396-0000039EC181E6F8.jpg';
      File imageFile = File(imagePath);

      // open a bytestream
      var stream =
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();

      // string to uri
      var uri = Uri.https(baseUrl, url);

      // create multipart request
      var request = new http.MultipartRequest("POST", uri);

      Map<String, dynamic> body = {
        'email': 'providermartin33@yopmail.com',
        'name': 'Provider Martin 33',
        'surname': 'silva',
        'phone': '3155125062',
        'document': '901811318',
        'porcentage': '36',
      };

      request.fields['provider'] = jsonEncode(body);
      // request.fields['name'] = 'Provider Martin';
      // request.fields['phone'] = '3155125062';

      request.headers['x-token'] =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1aWQiOiI2NDYzYjA2YTc0MjBiZjRkYTRjMWVjZWYiLCJpYXQiOjE3MjkwOTQ0NTcsImV4cCI6MTcyOTE4MDg1N30.p10lSMsSXAinWx1BqfFfPAeD_XS2RZL9NKoUQnrQBZc";

      // multipart that takes file
      var multipartFile = new http.MultipartFile('avatarURL', stream, length,
          filename: basename(imageFile.path));

      // add file to multipart
      request.files.add(multipartFile);

      log(request.fields.toString());
      // send
      var response = await request.send();
      print(response.statusCode);

      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });

      // Response response = await services.post(
      //   url: url,
      //   headers: headers,
      //   body: jsonEncode(body),
      // );

      // if (response.statusCode != 200) {
      //   return left('Error status code: ${response.statusCode}');
      // }
      // dynamic json = jsonDecode(response.body);

      log(json.toString());

      // List<dynamic> bodyList = json['data']['products'];

      // if (bodyList.isEmpty) {
      //   return left('List Products is empty');
      // }

      // List<ProductModel> list = List<ProductModel>.generate(
      //   bodyList.length,
      //   (int index) => ProductModel.fromJson(bodyList[index]),
      // );

      return right('list');
    } catch (e) {
      print('error $e');
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
