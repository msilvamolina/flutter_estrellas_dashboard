import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:estrellas_dashboard/app/app/controllers/main_controller.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:estrellas_dashboard/app/data/models/product_image/product_image_model.dart';
import 'package:estrellas_dashboard/app/data/models/product_variant_attributes/product_variant_attributes.dart';
import 'package:estrellas_dashboard/app/data/models/variant_attributte/variant_attributte.dart';
import 'package:estrellas_dashboard/app/data/models/variant_info/variant_info.dart';
import 'package:estrellas_dashboard/app/data/models/variant_variant/variant_variant.dart';
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
import 'package:image/image.dart' as img;

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
    String? imagePath,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();
      String email = _firebaseAuth.currentUser!.email!;

      String id = const Uuid().v4();

      if (imagePath != null) {
        mainController.setDropiMessage('Subiendo imagen a firebase');

        Map<String, String>? imagesMap = await uploadImageWithThumbs(
          id: id,
          productId: product.id,
          path: imagePath,
          type: 'product',
        );

        String thumb = imagesMap?['80x80'] ?? '';
        String standardImage = imagesMap?['400x400'] ?? '';
        String fullImage = imagesMap?['800x800'] ?? '';
        mainController.setDropiMessage('Escribiendo en firebase');

        String defaultVariantID =
            (product.variations[0]?['externalID'] ?? '').toString();
        await _firebaseFirestore.collection('products').doc(product.id).set({
          ...product.toDocument(),
          'thumbnail': thumb,
          'fullImage': fullImage,
          'standardImage': standardImage,
          'imagesMap': imagesMap,
          'defaultVariantID': defaultVariantID,
          'createdBy': email,
        });
      } else {
        await _firebaseFirestore
            .collection('products')
            .doc(product.id)
            .update(product.toDocumenWithoutImage());
      }

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
    required String warehouseName,
    required String provider,
    required String providerName,
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
        'warehouseName': warehouseName,
        'provider': provider,
        'providerName': providerName,
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

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(
        productModel.copyWith(
          warehouseID: warehouseID,
          warehouseName: warehouseName,
          providerID: provider,
          providerName: providerName,
        ),
      );
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
    required String warehouseName,
    required String providerName,
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

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(
        productModel.copyWith(
          warehouseID: warehouseID,
          warehouseName: warehouseName,
          providerID: provider,
          providerName: providerName,
        ),
      );
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ProductLiteModel>> updateProductWithoutImage({
    required String id,
    required String name,
    required String price,
    required String suggestedPrice,
    required String points,
    required String warehouseID,
    required String warehouseName,
    required String providerName,
    required String provider,
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
      };

      Response response = await services.postWithToken(url: url, body: body);
      dynamic json = jsonDecode(response.body);
      bool ok = json['ok'] ?? false;

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (!ok) {
        return left(json['data']);
      }

      ProductLiteModel productModel = ProductLiteModel.fromJson(json['data']);

      return right(
        productModel.copyWith(
          warehouseID: warehouseID,
          warehouseName: warehouseName,
          providerID: provider,
          providerName: providerName,
        ),
      );
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

  Future<ProductFirebaseModel?> getProductFromFirebaseById(
      String productId) async {
    try {
      DocumentSnapshot doc =
          await _firebaseFirestore.collection('products').doc(productId).get();

      if (doc.exists) {
        return ProductFirebaseModel.fromDocument(doc);
      } else {
        return null; // En caso de que el documento no exista
      }
    } catch (e) {
      print(e);
      return null; // Manejo de errores devolviendo null
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

  Stream<List<ProductVariantAttributesModel>> getAllProductVariantAttributes(
      {required String productId}) async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('products/$productId/attributes')
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProductVariantAttributesModel.fromDocument(doc))
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
    required String productId,
    required String imagePath,
  }) async {
    String email = _firebaseAuth.currentUser!.email!;

    try {
      String imageId = Uuid().v4();

      Map<String, String>? imagesMap = await uploadImageWithThumbs(
        id: imageId,
        productId: productId,
        path: imagePath,
        type: 'productImage',
      );

      String thumb = imagesMap?['80x80'] ?? '';
      String standardImage = imagesMap?['400x400'] ?? '';
      String fullImage = imagesMap?['800x800'] ?? '';

      if (imagesMap != null) {
        await _firebaseFirestore
            .collection('products')
            .doc(productId)
            .collection('images')
            .doc(imageId)
            .set({
          'order': 0,
          'id': imageId,
          'productId': productId,
          'imageUrl': thumb,
          'fullImage': fullImage,
          'standardImage': standardImage,
          'imagesMap': imagesMap,
          'createdBy': email,
          'createdAt': DateTime.now(),
        });
        return right(unit);
      }
      return left('La imágen no se cargó correctamente');
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Map<String, String>?> uploadImageWithThumbs({
    required String id,
    required String productId,
    required String path,
    required String type,
  }) async {
    MainController mainController = Get.find<MainController>();
    try {
      String email = _firebaseAuth.currentUser!.email!;

      File imageFile = File(path);

      // Leer y procesar la imagen original
      img.Image? originalImage = img.decodeImage(imageFile.readAsBytesSync());
      if (originalImage == null) {
        throw Exception("No se pudo procesar la imagen");
      }
      // Mapa para almacenar las URLs de descarga
      Map<String, String> downloadUrls = {};
      Map<String, String> paths = {};

      // Lista de tamaños a generar
      List<int> sizes = [80, 200, 400, 800];
      // Generar y subir las versiones redimensionadas
      for (int size in sizes) {
        // Redimensionar la imagen
        img.Image resizedImage =
            img.copyResize(originalImage, width: size, height: size);

        // Guardar temporalmente la imagen redimensionada
        String resizedFileName = 'thumb_${size}x$size$id.png';
        String resizedFilePath = '${imageFile.parent.path}/$resizedFileName';
        File resizedFile = File(resizedFilePath)
          ..writeAsBytesSync(img.encodePng(resizedImage));

        mainController.setDropiMessage('Generando imagen ${size}x${size}');
        String imageDestination = 'products/$productId/';
        Reference resizedRef = _firebaseStorage
            .ref()
            .child(imageDestination)
            .child(resizedFileName);

        UploadTask resizedUploadTask = resizedRef.putFile(resizedFile);
        TaskSnapshot resizedSnap = await resizedUploadTask;
        String resizedDownloadUrl = await resizedSnap.ref.getDownloadURL();

        downloadUrls['${size}x$size'] = resizedDownloadUrl;
        paths['${size}x$size'] = resizedFilePath;

        resizedFile.deleteSync();
      }

      String thumb = downloadUrls['80x80'] ?? '';
      String standardImage = downloadUrls['400x400'] ?? '';
      String fullImage = downloadUrls['800x800'] ?? '';

      await _firebaseFirestore.collection('images').doc(id).set({
        'id': id,
        'type': type,
        'thumbnail': thumb,
        'fullImage': fullImage,
        'standardImage': standardImage,
        'imagesMap': downloadUrls,
        'imagesPaths': paths,
        'productId': productId,
        'createdBy': email,
        'createdAt': DateTime.now(),
      });

      // Retornar el mapa con todas las URLs
      return downloadUrls;
    } on FirebaseException catch (e) {
      return null;
    } catch (e) {
      return null;
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
      String bodyJson = jsonEncode(requestBody);

      log(bodyJson.toString());

      Response response = await services.postJsonWithToken(
        url: url,
        body: bodyJson,
      );

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
    String email = _firebaseAuth.currentUser!.email!;

    try {
      final productId = product['_id'] as String;
      final variantsRef = _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants');

      final existingVariants = await variantsRef.get();
      for (var doc in existingVariants.docs) {
        await doc.reference.delete();
      }

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
          'createdAt': DateTime.now(),
          'createdBt': email,
        });
      }
      String? defaultVariantID =
          (variations[0]?['externalID'] ?? '').toString();
      dynamic defaultVariantInfo = variations[0];
      await _firebaseFirestore.collection('products').doc(productId).update({
        '_hola': 'hihi222',
        'defaultVariantID': defaultVariantID,
        'defaultVariantInfo': defaultVariantInfo,
      });

      final variantsRef2 = _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('attributes');

      final existingVariants2 = await variantsRef2.get();
      for (var doc in existingVariants2.docs) {
        await doc.reference.delete();
      }

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
          'createdAt': DateTime.now(),
          'createdBt': email,
        });
      }

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> updateFirebaseCombinations({
    required Map<String, dynamic> product,
  }) async {
    try {
      final productId = product['_id'] as String;

      final variantsRef = _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variants');

      final existingVariants = await variantsRef.get();
      for (var doc in existingVariants.docs) {
        await doc.reference.delete();
      }

      final variations = product['variations'] as List<dynamic>;

      for (var variation in variations) {
        final variationId = variation['_id'] as String;

        await variantsRef.doc(variationId).set({
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
      String? defaultVariantID =
          (variations[0]?['externalID'] ?? '').toString();
      dynamic defaultVariantInfo = variations[0];

      await _firebaseFirestore.collection('products').doc(productId).update({
        '_hola': 'hola2233',
        'defaultVariantID': defaultVariantID,
        'defaultVariantInfo': defaultVariantInfo,
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    } catch (e) {
      return left(e.toString());
    }
  }

  Stream<List<VariantAttributeModel>> getAttributes() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('admin')
          .doc('productsVariations')
          .collection('attributes')
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => VariantAttributeModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Stream<List<VariantVariantModel>> getVariant() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('admin')
          .doc('productsVariations')
          .collection('variants')
          .orderBy('name', descending: false)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => VariantVariantModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
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

  Future<Either<String, Map<String, String>>> saveImageVariants({
    required String productId,
    required String variantId,
    required String imagePath,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();

      mainController.setDropiMessage('Subiendo imagen');

      Map<String, String>? imagesMap = await uploadImageWithThumbs(
        id: variantId,
        productId: productId,
        path: imagePath,
        type: 'productVariant',
      );

      if (imagesMap != null) {
        return right(imagesMap);
      } else {
        return left('Imagen nula');
      }
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> saveVariantInFirebase({
    required VariantVariantModel variant,
    required String productId,
  }) async {
    try {
      MainController mainController = Get.find<MainController>();
      String email = _firebaseAuth.currentUser!.email!;
      VariantVariantModel newVariant = variant.copyWith(createdBy: email);

      if (variant.isImage) {
        mainController.setDropiMessage('Subiendo imagen');

        Map<String, String>? imagesMap = await uploadImageWithThumbs(
          id: variant.id,
          productId: productId,
          path: variant.value,
          type: 'productVariantType',
        );

        String thumb = imagesMap?['80x80'] ?? '';
        String standardImage = imagesMap?['400x400'] ?? '';
        String fullImage = imagesMap?['800x800'] ?? '';
        if (imagesMap != null) {
          newVariant = newVariant.copyWith(
            value: thumb,
            standardImage: standardImage,
            fullImage: fullImage,
          );
        }
      }

      await _firebaseFirestore
          .collection('admin')
          .doc('productsVariations')
          .collection('variants')
          .doc(newVariant.id)
          .set({
        ...newVariant.toJson(),
        'createdAt': DateTime.now(),
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<Either<String, Unit>> saveVariantsInfoInFirebase({
    required Map<String, dynamic> body,
    required String productId,
  }) async {
    try {
      String email = _firebaseAuth.currentUser!.email!;

      await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variantsInfo')
          .doc('variantsInfo')
          .set({
        ...body,
        'createdBy': email,
        'createdAt': DateTime.now(),
      });

      await _firebaseFirestore.collection('products').doc(productId).update({
        'haveVariants': true,
      });

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }

  Future<VariantInfoModel?> getVariantsInfo(String productId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await _firebaseFirestore
          .collection('products')
          .doc(productId)
          .collection('variantsInfo')
          .doc('variantsInfo')
          .get();

      if (!snapshot.exists || snapshot.data() == null) {
        throw Exception("El documento no existe o está vacío.");
      }

      final data = snapshot.data()!;

      List<VariantAttributeModel> attributes =
          (data['attributes'] as List<dynamic>)
              .map((json) =>
                  VariantAttributeModel.fromJson(json as Map<String, dynamic>))
              .toList();

      List<VariantVariantModel> variants = (data['variants'] as List<dynamic>)
          .map((json) =>
              VariantVariantModel.fromJson(json as Map<String, dynamic>))
          .toList();

      VariantInfoModel variantInfoModel =
          VariantInfoModel(attributes: attributes, variants: variants);
      return variantInfoModel;
    } catch (e) {
      print('Error al obtener datos de Firebase: $e');
      return null;
    }
  }

  Future<Either<String, Unit>> changeDefaultVariant({
    required String productId,
    required ProductVariantModel variant,
  }) async {
    String email = _firebaseAuth.currentUser!.email!;

    String defaultVariantID = (variant.externalID ?? '').toString();
    try {
      await _firebaseFirestore.collection('products').doc(productId).update(
        {
          'defaultVariantID': defaultVariantID,
          'defaultVariantInfo': variant.toJson(),
          'updatedAt': DateTime.now(),
          'updatedBy': email,
        },
      );

      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
