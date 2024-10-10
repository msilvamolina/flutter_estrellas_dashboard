import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';
import '../category/product_category.dart';
import '../provider/product_provider.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class ProductModel implements _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    @JsonKey(name: '_id') required String id,
    required ProductProviderModel provider,
    required ProductCategoryModel category,
    required String name,
    required String externalId,
    required String usefulId,
    required String videoUrl,
    required String description,
    required String type,
    required String sku,
    required double price,
    required bool active,
    required bool isPercentage,
    required int points,
    required double suggestedPrice,
    required String thumbnail,
    required String createdAt,
    required String uploadDate,
    required String updatedAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
