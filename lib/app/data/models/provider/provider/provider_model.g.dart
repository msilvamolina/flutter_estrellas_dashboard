// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderModelImpl _$$ProviderModelImplFromJson(Map<String, dynamic> json) =>
    _$ProviderModelImpl(
      id: json['_id'] as String,
      warehouses: (json['warehouses'] as List<dynamic>)
          .map(
              (e) => ProviderWarehouseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String,
      email: json['email'] as String,
      document: json['document'] as String,
      phone: json['phone'] as String,
      externalID: json['externalID'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$$ProviderModelImplToJson(_$ProviderModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'warehouses': instance.warehouses,
      'name': instance.name,
      'email': instance.email,
      'document': instance.document,
      'phone': instance.phone,
      'externalID': instance.externalID,
      'isActive': instance.isActive,
    };
