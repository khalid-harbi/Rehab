// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) => _OwnerModel(
  totalRevenue: (json['totalRevenue'] as num).toDouble(),
  propertyCount: (json['propertyCount'] as num).toInt(),
  paidBookingsCount: (json['paidBookingsCount'] as num).toInt(),
);

Map<String, dynamic> _$OwnerModelToJson(_OwnerModel instance) =>
    <String, dynamic>{
      'totalRevenue': instance.totalRevenue,
      'propertyCount': instance.propertyCount,
      'paidBookingsCount': instance.paidBookingsCount,
    };
