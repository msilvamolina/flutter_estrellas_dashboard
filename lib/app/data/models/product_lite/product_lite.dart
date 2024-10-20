import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'product_lite.freezed.dart';
part 'product_lite.g.dart';

@freezed
abstract class ProductLiteModel implements _$ProductLiteModel {
  const ProductLiteModel._();

  const factory ProductLiteModel({
    @JsonKey(name: '_id') required String id,
    required String? provider,
    required String? name,
    required String? externalId,
    required double? price,
    required int? points,
    required double? suggestedPrice,
    required String? type,
    required bool? isPercentage,
    required bool? showInFeed,
    required bool? active,
    required String? createdAt,
    required String? updatedAt,
  }) = _ProductLiteModel;

  factory ProductLiteModel.fromJson(Map<String, dynamic> json) =>
      _$ProductLiteModelFromJson(json);

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
