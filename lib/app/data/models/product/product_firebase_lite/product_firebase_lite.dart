import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estrellas_dashboard/app/data/models/product/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/friendly_helpers.dart';
import '../../../helpers/model_helpers.dart';
import '../product_firebase/product_firebase_model.dart';
import '../provider/product_provider.dart';

part 'product_firebase_lite.freezed.dart';
part 'product_firebase_lite.g.dart';

@freezed
abstract class ProductFirebaseLiteModel implements _$ProductFirebaseLiteModel {
  const ProductFirebaseLiteModel._();

  const factory ProductFirebaseLiteModel({
    @JsonKey(name: '_id') required String id,
    String? name,
    dynamic provider,
    String? externalId,
    String? type,
    double? price,
    bool? active,
    int? points,
    double? suggestedPrice,
    String? thumbnail,
    String? createdAt,
  }) = _ProductFirebaseLiteModel;

  factory ProductFirebaseLiteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductFirebaseLiteModelFromJson(json);

  factory ProductFirebaseLiteModel.fromDocument(DocumentSnapshot doc) =>
      ProductFirebaseLiteModel.fromJson(ModelHelpers.fromDocument(doc.data()!));
  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());

  static ProductFirebaseLiteModel? fromProduct(ProductFirebaseModel? product) {
    if (product == null) {
      return null;
    }
    try {
      return ProductFirebaseLiteModel.fromJson(product.toJson());
    } catch (_) {
      return null;
    }
  }
}
