// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      suggestedPrice: (json['suggestedPrice'] as num).toDouble(),
      thumbnail: json['thumbnail'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'suggestedPrice': instance.suggestedPrice,
      'thumbnail': instance.thumbnail,
      'createdAt': instance.createdAt,
    };
