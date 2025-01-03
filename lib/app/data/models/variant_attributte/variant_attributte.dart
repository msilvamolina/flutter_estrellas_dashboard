import 'package:freezed_annotation/freezed_annotation.dart';

part 'variant_attributte.freezed.dart';
part 'variant_attributte.g.dart';

@freezed
abstract class VariantAttributeModel with _$VariantAttributeModel {
  const factory VariantAttributeModel({
    required String id,
    required String name,
    required String createdBy,
  }) = _VariantAttributeModel;

  factory VariantAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$VariantAttributeModelFromJson(json);
}
