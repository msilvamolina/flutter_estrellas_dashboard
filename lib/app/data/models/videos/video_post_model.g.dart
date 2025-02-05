// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoPostModelImpl _$$VideoPostModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoPostModelImpl(
      name: json['name'] as String,
      active: json['active'] as bool? ?? false,
      id: json['id'] as String,
      createdAt: json['createdAt'] as String,
      thumbnail: json['thumbnail'] as String,
      videoUrl: json['videoUrl'] as String,
      createdByEmail: json['createdByEmail'] as String,
      createdById: json['createdById'] as String,
      productId: json['productId'] as String?,
      product: json['product'] == null
          ? null
          : ProductFirebaseModel.fromJson(
              json['product'] as Map<String, dynamic>),
      searchField: json['searchField'] as String?,
      reference: json['reference'],
    );

Map<String, dynamic> _$$VideoPostModelImplToJson(
        _$VideoPostModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'active': instance.active,
      'id': instance.id,
      'createdAt': instance.createdAt,
      'thumbnail': instance.thumbnail,
      'videoUrl': instance.videoUrl,
      'createdByEmail': instance.createdByEmail,
      'createdById': instance.createdById,
      'productId': instance.productId,
      'product': instance.product,
      'searchField': instance.searchField,
      'reference': instance.reference,
    };
