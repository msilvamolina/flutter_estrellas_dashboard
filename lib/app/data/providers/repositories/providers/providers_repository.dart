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
import 'package:uuid/uuid.dart';

import '../../../../app/controllers/main_controller.dart';
import '../../../../services/api_services.dart';
import '../../../models/product/product_firebase/product_firebase_model.dart';
import '../../../models/product_variant/product_variant_model.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image/image.dart' as img;
import '../../../models/provider/provider/provider_model.dart';

class ProvidersRepository {
  ApiServices services = ApiServices();
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = Get.find<FirebaseStorage>();

  Stream<List<ProviderModel>> getProviersFromFirebase() async* {
    try {
      Stream<QuerySnapshot> snapshots = _firebaseFirestore
          .collection('providers')
          .orderBy('createdAt', descending: true)
          .snapshots();

      yield* snapshots.map((snapshot) {
        return snapshot.docs
            .map((doc) => ProviderModel.fromDocument(doc))
            .toList();
      });
    } catch (e) {
      print(e);
    }
  }

  Future<Either<String, List<ProviderModel>>> getProvidersFromBackend() async {
    String url = 'api/provider/get-all';
    try {
      Response response = await services.getWithToken(url: url);

      dynamic json = jsonDecode(response.body);
      List<dynamic> bodyList = json['data']['providers'];

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (bodyList.isEmpty) {
        return left('List Products is empty');
      }

      List<ProviderModel> list = List<ProviderModel>.generate(
        bodyList.length,
        (int index) => ProviderModel.fromJson(bodyList[index]),
      );

      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Map<String, String>?> uploadImageWithThumbs({
    required String id,
    required String providerId,
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
        String imageDestination = 'providers/$providerId/';
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
        'providerId': providerId,
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

  Future<Either<String, Unit>> saveProviderInFirebase({
    required ProviderModel provider,
    String? imagePath,
  }) async {
    MainController mainController = Get.find<MainController>();
    String email = _firebaseAuth.currentUser!.email!;

    if (imagePath != null) {
      mainController.setDropiMessage('Subiendo imagen');

      String id = Uuid().v4();
      Map<String, String>? imagesMap = await uploadImageWithThumbs(
        id: id,
        providerId: provider.id,
        path: imagePath,
        type: 'provider',
      );
      String thumb = imagesMap?['80x80'] ?? '';
      String standardImage = imagesMap?['400x400'] ?? '';
      String fullImage = imagesMap?['800x800'] ?? '';

      Map<String, dynamic> document = provider.toDocument();
      document['avatarUrl'] = thumb;
      document['standardImage'] = standardImage;
      document['fullImage'] = fullImage;
      document['createdBy'] = email;

      try {
        await _firebaseFirestore
            .collection('providers')
            .doc(provider.id)
            .set(document);
        return right(unit);
      } on FirebaseException catch (e) {
        return left(e.code);
      }
    } else {
      try {
        await _firebaseFirestore
            .collection('providers')
            .doc(provider.id)
            .set(provider.toDocument());
        return right(unit);
      } on FirebaseException catch (e) {
        return left(e.code);
      }
    }
  }

  Future<Either<String, ProviderModel>> createProvider({
    required String avatarURL,
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String document,
    required String porcentage,
  }) async {
    String url = 'api/provider/create';
    try {
      Map<String, dynamic> body = {
        'email': email,
        'name': name,
        'surname': surname,
        'phone': phone,
        'document': document,
        'porcentage': porcentage,
      };

      Map<String, dynamic> fields = {
        'provider': jsonEncode(body),
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: fields,
        fieldImageName: 'avatarURL',
        fieldImagePath: avatarURL,
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

      ProviderModel providerModel = ProviderModel.fromJson(json['data']);

      return right(providerModel);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, ProviderModel>> updateProvider({
    required String externalId,
    required String avatarURL,
    required String name,
    required String surname,
    required String email,
    required String phone,
    required String document,
    required String porcentage,
  }) async {
    String url = 'api/provider/updateProvider';
    try {
      Map<String, dynamic> body = {
        'externalID': externalId,
        'email': email,
        'name': name,
        'surname': surname,
        'phone': phone,
        'document': document,
        'porcentage': porcentage,
      };

      Map<String, dynamic> fields = {
        'provider': jsonEncode(body),
      };

      StreamedResponse response = await services.postWithFileAndToken(
        url: url,
        fields: fields,
        fieldImageName: 'avatarURL',
        fieldImagePath: avatarURL,
      );

      String responseBody =
          await response.stream.transform(utf8.decoder).join();

      dynamic json = jsonDecode(responseBody);

      log(json['data'].toString());
      bool ok = json['ok'] ?? false;

      if (response.statusCode != 200) {
        String? data = json['data'];
        return left('Error status code: ${response.statusCode}.\n$data');
      }

      if (!ok) {
        return left(json['data']);
      }

      ProviderModel providerModel = ProviderModel.fromJson(json['data']);

      return right(providerModel);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Unit>> deleteProvider({
    required String id,
  }) async {
    String url = 'api/provider/deleteProvider';
    try {
      Map<String, dynamic> body = {
        "providerID": id,
        "motiveBan": "4",
        "reasonBan": "Ya no existe el proveedor"
      };

      Response response = await services.postWithToken(url: url, body: body);
      dynamic json = jsonDecode(response.body);

      log(json.toString());

      bool ok = json['ok'] ?? false;

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

  Future<Either<String, ProviderModel>> createWarehouse({
    required String name,
    required String phone,
    required String city,
    required String address,
    required String provider,
  }) async {
    String url = 'api/provider/create-warehouse';
    try {
      Map<String, dynamic> body = {
        "name": name,
        "phone": phone,
        "city": city,
        "address": address,
        "provider": provider
      };

      log(body.toString());
      Response response = await services.postWithToken(url: url, body: body);

      dynamic json = jsonDecode(response.body);
      bool ok = json['ok'] ?? false;

      if (!ok) {
        return left(json['data']);
      }

      ProviderModel providerModel = ProviderModel.fromJson(json['data']);

      return right(providerModel);
    } catch (e) {
      return left(e.toString());
    }
  }
}
