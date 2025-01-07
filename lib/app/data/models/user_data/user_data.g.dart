// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      uid: json['uid'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String,
      createdAt: json['createdAt'] as String?,
      createdBy: json['createdBy'] as String?,
      username: json['username'] as String?,
      searchField: json['searchField'] as String?,
      reference: json['reference'],
      defaultCurrency: json['defaultCurrency'] as String?,
      currencies: json['currencies'] as Map<String, dynamic>?,
      isAnonymous: json['isAnonymous'] as bool? ?? false,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'fullName': instance.fullName,
      'createdAt': instance.createdAt,
      'createdBy': instance.createdBy,
      'username': instance.username,
      'searchField': instance.searchField,
      'reference': instance.reference,
      'defaultCurrency': instance.defaultCurrency,
      'currencies': instance.currencies,
      'isAnonymous': instance.isAnonymous,
      'updatedAt': instance.updatedAt,
    };
