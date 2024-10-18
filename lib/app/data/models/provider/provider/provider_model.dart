import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../helpers/model_helpers.dart';
import '../warehouse/provider_warehouse_model.dart';

part 'provider_model.freezed.dart';
part 'provider_model.g.dart';

@freezed
abstract class ProviderModel implements _$ProviderModel {
  const ProviderModel._();

  const factory ProviderModel({
    @JsonKey(name: '_id') required String id,
    List<ProviderWarehouseModel>? warehouses,
    int? externalID,
    String? name,
    String? email,
    String? document,
    String? phone,
    bool? isActive,
    int? porcentage,
    String? createdAt,
    String? uploadDate,
    String? updatedAt,
    String? avatarUrl,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
