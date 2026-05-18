// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => _OwnerModel(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  totalRevenue: (json['totalRevenue'] as num).toDouble(),
);

Map<String, dynamic> _$OwnerModelToJson(_OwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'totalRevenue': instance.totalRevenue,
    };
