// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      name: json['name'] as String,
      usefulId: json['usefulId'] as String,
      videoUrl: json['videoUrl'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      sku: json['sku'] as String,
      price: (json['price'] as num).toDouble(),
      active: json['active'] as bool,
      isPercentage: json['isPercentage'] as bool,
      points: (json['points'] as num).toInt(),
      suggestedPrice: (json['suggestedPrice'] as num).toDouble(),
      thumbnail: json['thumbnail'] as String,
      createdAt: json['createdAt'] as String,
      uploadDate: json['uploadDate'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'usefulId': instance.usefulId,
      'videoUrl': instance.videoUrl,
      'description': instance.description,
      'type': instance.type,
      'sku': instance.sku,
      'price': instance.price,
      'active': instance.active,
      'isPercentage': instance.isPercentage,
      'points': instance.points,
      'suggestedPrice': instance.suggestedPrice,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt,
      'uploadDate': instance.uploadDate,
      'updatedAt': instance.updatedAt,
    };
