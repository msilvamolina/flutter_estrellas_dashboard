// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_lite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductLiteModelImpl _$$ProductLiteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductLiteModelImpl(
      id: json['_id'] as String,
      name: json['name'] as String?,
      externalId: (json['externalId'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      points: (json['points'] as num?)?.toInt(),
      suggestedPrice: (json['suggestedPrice'] as num?)?.toDouble(),
      type: json['type'] as String?,
      isPercentage: json['isPercentage'] as bool?,
      showInFeed: json['showInFeed'] as bool?,
      active: json['active'] as bool?,
      descriptionFormatted: json['descriptionFormatted'],
      descriptionPlainText: json['descriptionPlainText'] as String?,
      detailsFormatted: json['detailsFormatted'],
      detailsPlainText: json['detailsPlainText'] as String?,
      warrantyFormatted: json['warrantyFormatted'],
      warrantyPlainText: json['warrantyPlainText'] as String?,
      thumbnail: json['thumbnail'] as String?,
      defaultVariation: json['defaultVariation'] as String?,
      attributes: json['attributes'],
      variations: json['variations'],
      warehouseID: json['warehouseID'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$ProductLiteModelImplToJson(
        _$ProductLiteModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'externalId': instance.externalId,
      'price': instance.price,
      'points': instance.points,
      'suggestedPrice': instance.suggestedPrice,
      'type': instance.type,
      'isPercentage': instance.isPercentage,
      'showInFeed': instance.showInFeed,
      'active': instance.active,
      'descriptionFormatted': instance.descriptionFormatted,
      'descriptionPlainText': instance.descriptionPlainText,
      'detailsFormatted': instance.detailsFormatted,
      'detailsPlainText': instance.detailsPlainText,
      'warrantyFormatted': instance.warrantyFormatted,
      'warrantyPlainText': instance.warrantyPlainText,
      'thumbnail': instance.thumbnail,
      'defaultVariation': instance.defaultVariation,
      'attributes': instance.attributes,
      'variations': instance.variations,
      'warehouseID': instance.warehouseID,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
