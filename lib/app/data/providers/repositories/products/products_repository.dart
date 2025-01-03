import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_image/product_image_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/instance_manager.dart';
import 'package:http/http.dart';
import 'package:uuid/uuid.dart';

import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_lite/product_lite.dart';
import '../../../models/product_variant/product_variant_model.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../models/product_variant_combination/product_variant_combination_model.dart';

class ProductsRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Future<Either<String, List<ProductModel>>> getProductsFromBackend() async {
    String url = 'api/products/allProducts/?term=Protector';
    try {
      Response response = await services.get(url: url);

      dynamic json = jsonDecode(response.body);

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }
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
    required String imagePath,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();

      String id = const Uuid().v4();

      mainController.setDropiMessage('Subiendo imagen a firebase');
      String? imageUrl =
          await uploadImage(id: id, productId: product.id, path: imagePath);

      mainController.setDropiMessage('Escribiendo en firebase');

      await _firebaseFirestore
          .collection('products')
          .doc(product.id)
          .set(product.toDocument(imageUrl));
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
    required String stock,
    required String warehouseID,
    required String provider,
    required String imagePath,
    required String description,
    required String category,
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
        'description': description,
        'category': category,
        'stock': stock,
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: body,
        fieldImageName: 'image',
        fieldImagePath: imagePath,
      );

      String responseBody =
          await response.stream.transform(utf8.decoder).join();

      dynamic json = jsonDecode(responseBody);
      bool ok = json['ok'] ?? false;

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (!ok) {
        return left(json['data']);
      }

      log(json['data'].toString());

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(productModel.copyWith(warehouseID: warehouseID));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ProductLiteModel>> updateProduct({
    required String id,
    required String name,
    required String price,
    required String suggestedPrice,
    required String points,
    required String warehouseID,
    required String provider,
    required String imagePath,
    required String description,
    required String category,
    required String stock,
  }) async {
    String url = 'api/products/updateProduct';
    try {
      Map<String, dynamic> body = {
        'id': id,
        'name': name,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'points': points,
        'warehouseID': warehouseID,
        'provider': provider,
        'description': description,
        'category': category,
        'stock': stock,

        // 'weight': '100',
        // 'length': '321',
        // 'width': '1231',
        // 'height': '1231',
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: body,
        fieldImageName: 'image',
        fieldImagePath: imagePath,
      );

      String responseBody =
          await response.stream.transform(utf8.decoder).join();

      dynamic json = jsonDecode(responseBody);

      bool ok = json['ok'] ?? false;

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (!ok) {
        return left(json['data']);
      }

      log(json['data'].toString());

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(productModel.copyWith(warehouseID: warehouseID));
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> deleteProduct({
    required String externalId,
  }) async {
    String url = 'api/products/deleteProduct';
    try {
      Map<String, dynamic> body = {
        'externalId': externalId,
      };

      Response response = await services.postWithToken(url: url, body: body);
      dynamic json = jsonDecode(response.body);
      bool ok = json['ok'] ?? false;

      log(json.toString());

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (!ok) {
        return left(json['data']);
      }

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  Stream<List<ProductFirebaseModel>> getProductsFromFirebase() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products')
          .orderBy('createdAt', descending: true)
          .snapshots();

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
          .orderBy('order', descending: false)
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
      {required String productId, required String type}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/variants')
          .where('type', isEqualTo: type)
          .orderBy('order', descending: false)
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

  Stream<List<ProductVariantCombinationModel>>
      getAllProductVariantsCombinations({required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/variants_combinations')
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantCombinationModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<ProductVariantModel>> getAllProductVariants(
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
      await _firebaseFirestore
          .collection('products')
          .doc(product.id)
          .set(product.toDocument());
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
      String? imageUrl =
          await uploadImage(id: id, productId: productId, path: path);

      if (imageUrl != null) {
        await _firebaseFirestore
            .collection('products')
            .doc(productId)
            .collection('images')
            .doc(id)
            .set({
          'order': 0,
          'id': id,
          'name': name,
          'imageUrl': imageUrl,
          'createdAt': DateTime.now(),
        });
        return right(unit);
      }
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
    required String productId,
    required String name,
    required String label,
    required String type,
    int? color,
    String? imageUrl,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();

      String id = const Uuid().v4();
      String? newImageUrl;
      if (imageUrl != null) {
        mainController.setDropiMessage('Subiendo imagen a firebase');
        newImageUrl =
            await uploadImage(id: id, productId: productId, path: imageUrl);
      }

      mainController.setDropiMessage('Escribiendo en firebase');

      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants')
          .doc(id)
          .set({
        'id': id,
        'name': name,
        'label': label,
        'type': type,
        'color': color,
        'imageUrl': newImageUrl,
        'order': 0,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> saveVariantComination({
    required String productId,
    required String name,
    required String label,
    int? color,
    String? imageUrl,
    String? sizeId,
    String? sizeName,
    String? sizeLabel,
    String? colorId,
    String? colorName,
    String? colorLabel,
    double? price,
    int? stock,
    double? suggestedPrice,
    int? points,
  }) async {
    try {
      String id = const Uuid().v4();

      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants_combinations')
          .doc(id)
          .set({
        'id': id,
        'name': name,
        'label': label,
        'color': color,
        'imageUrl': imageUrl,
        'sizeId': sizeId,
        'sizeName': sizeName,
        'sizeLabel': sizeLabel,
        'colorId': colorId,
        'colorName': colorName,
        'colorLabel': colorLabel,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'points': points,
        'stock': stock,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> updateVariantComination({
    required String productId,
    required String variationCombinationId,
    double? price,
    int? stock,
    double? suggestedPrice,
    int? points,
    String? dropiId,
  }) async {
    try {
      String id = const Uuid().v4();

      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants_combinations')
          .doc(variationCombinationId)
          .update({
        'id': id,
        'price': price,
        'suggestedPrice': suggestedPrice,
        'points': points,
        'stock': stock,
        'dropiId': dropiId,
        'updatedAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> updateImageOrder({
    required String productId,
    required String imageId,
    required int order,
  }) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('images')
          .doc(imageId)
          .update({
        'order': order,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> updateVariantOrder({
    required String productId,
    required String variantId,
    required int order,
  }) async {
    try {
      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants')
          .doc(variantId)
          .update({
        'order': order,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Map<String, dynamic>>> updateProductVariations({
    required Map<String, dynamic> requestBody,
  }) async {
    String url = 'api/products/updateProduct';

    try {
      // Serializamos el cuerpo a JSON
      String bodyJson = jsonEncode(requestBody);

      log(bodyJson.toString());
      // Enviamos la solicitud PUT
      Response response = await services.postJsonWithToken(
        url: url,
        body: bodyJson, // Pasamos el cuerpo como JSON serializado
      );

      // Parseamos la respuesta
      dynamic json = jsonDecode(response.body);
      bool ok = json['ok'] ?? false;

      if (!ok) {
        return left(json['data']);
      }

      return right(json['data']);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> saveCombinations({
    required Map<String, dynamic> product,
  }) async {
    try {
      // ID del producto
      final productId = product['_id'] as String;

      // Guardar las variaciones
      final variations = product['variations'] as List<dynamic>;
      for (var variation in variations) {
        final variationId = variation['_id'] as String;

        await _firebaseFirestore
            .collection('products')
            .doc(productId)
            .collection('variants')
            .doc(variationId)
            .set({
          'id': variationId,
          'externalID': variation['externalID'],
          'sale_price': variation['sale_price'],
          'suggested_price': variation['suggested_price'],
          'points': variation['points'],
          'sku': variation['sku'],
          'stock': variation['stock'],
          'values': variation['values'],
        });
      }

      // Guardar los atributos
      final attributes = product['attributes'] as List<dynamic>;
      for (var attribute in attributes) {
        final attributeId = attribute['_id'] as String;

        await _firebaseFirestore
            .collection('products')
            .doc(productId)
            .collection('attributes')
            .doc(attributeId)
            .set({
          'id': attributeId,
          'description': attribute['description'],
          'isVariation': attribute['isVariation'],
          'values': attribute['values'],
        });
      }

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> saveAttributeInFirebase({
    required String name,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();
      String email = _firebaseAuth.currentUser!.email!;

      String id = const Uuid().v4();

      mainController.setDropiMessage('Escribiendo en firebase');

      await _firebaseFirestore
          .collection('admin')
          .doc('productsVariations')
          .collection('attributes')
          .doc(id)
          .set({
        'id': id,
        'name': name,
        'createdBy': email,
        'createdAt': DateTime.now(),
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
