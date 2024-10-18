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
    required List<ProviderWarehouseModel> warehouses,
    required String name,
    required String email,
    required String document,
    required String phone,
    required String externalID,
    required bool isActive,
  }) = _ProviderModel;

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  Map<String, dynamic> toDocument() => ModelHelpers.toDocument(toJson());
}
