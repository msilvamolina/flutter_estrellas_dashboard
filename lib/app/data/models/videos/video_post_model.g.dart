// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoPostModelImpl _$$VideoPostModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoPostModelImpl(
      name: json['name'] as String,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      searchField: json['searchField'] as String?,
      reference: json['reference'],
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$VideoPostModelImplToJson(
        _$VideoPostModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'searchField': instance.searchField,
      'reference': instance.reference,
      'updatedAt': instance.updatedAt,
    };
