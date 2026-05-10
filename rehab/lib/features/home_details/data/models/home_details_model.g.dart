// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeDetailsModel _$HomeDetailsModelFromJson(Map<String, dynamic> json) =>
    _HomeDetailsModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$HomeDetailsModelToJson(_HomeDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
