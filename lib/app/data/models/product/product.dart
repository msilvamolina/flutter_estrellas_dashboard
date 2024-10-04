import 'package:freezed_annotation/freezed_annotation.dart';

import '../../helpers/model_helpers.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class ProductModel implements _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required String name,
    required String description,
    required double price,
    required double suggestedPrice,
    required String thumbnail,
    required String createdAt,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toDocument() => ModelHelpers().toDocument(toJson());
}
