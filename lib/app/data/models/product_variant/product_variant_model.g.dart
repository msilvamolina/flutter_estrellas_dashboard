// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_variant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductVariantModelImpl _$$ProductVariantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductVariantModelImpl(
      id: json['id'] as String,
      points: (json['points'] as num).toInt(),
      sale_price: (json['sale_price'] as num).toDouble(),
      sku: json['sku'] as String,
      stock: (json['stock'] as num).toInt(),
      suggested_price: (json['suggested_price'] as num).toDouble(),
      values: json['values'],
    );

Map<String, dynamic> _$$ProductVariantModelImplToJson(
        _$ProductVariantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'points': instance.points,
      'sale_price': instance.sale_price,
      'sku': instance.sku,
      'stock': instance.stock,
      'suggested_price': instance.suggested_price,
      'values': instance.values,
    };
