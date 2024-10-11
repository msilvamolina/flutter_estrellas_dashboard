import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../models/product/product/product.dart';

class ProductsFirebaseRepository {
  final FirebaseFirestore _firebaseFirestore = Get.find<FirebaseFirestore>();

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
        'createdAt': product.createdAt,
        'updatedAt': product.updatedAt,
        'uploadDate': product.uploadDate,
        'description': product.description,
      });
      return right(unit);
    } on FirebaseException catch (e) {
      return left(e.code);
    }
  }
}
