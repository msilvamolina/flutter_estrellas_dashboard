import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'product_lite.freezed.dart';
part 'product_lite.g.dart';

@freezed
abstract class ProductLiteModel implements _$ProductLiteModel {
  const ProductLiteModel._();

  const factory ProductLiteModel({
    @JsonKey(name: '_id') required String id,
    String? name,
    int? externalId,
    double? price,
    int? points,
    int? stock,
    double? suggestedPrice,
    String? type,
    bool? isPercentage,
    bool? showInFeed,
    bool? active,
    dynamic categories,
    String? categoriesIds,
    String? categoriesNames,
    dynamic category,
    dynamic descriptionFormatted,
    String? descriptionPlainText,
    dynamic detailsFormatted,
    String? detailsPlainText,
    dynamic warrantyFormatted,
    String? warrantyPlainText,
    String? thumbnail,
    String? defaultVariation,
    dynamic attributes,
    dynamic variations,
    dynamic provider,
    dynamic? providerID,
    String? providerName,
    String? warehouseID,
    String? warehouseName,
    String? createdAt,
    String? updatedAt,
  }) = _ProductLiteModel;

  factory ProductLiteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductLiteModelFromJson(json);

  Map<String, dynamic> toDocument(String? imageUrl) {
    Map<String, dynamic> json = toJson();

    if (imageUrl != null) {
      json['thumbnail'] = imageUrl;
    }

    json['createdAt'] = ModelHelpers.dateToDocument(json['createdAt']);
    json['updatedAt'] = ModelHelpers.dateToDocument(json['updatedAt']);

    return json;
  }
}
