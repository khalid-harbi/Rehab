// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddAdModel _$AddAdModelFromJson(Map<String, dynamic> json) => _AddAdModel(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
);

Map<String, dynamic> _$AddAdModelToJson(_AddAdModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
