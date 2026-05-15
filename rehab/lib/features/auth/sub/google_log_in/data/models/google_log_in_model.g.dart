// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_log_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleLogInModel _$GoogleLogInModelFromJson(Map<String, dynamic> json) =>
    _GoogleLogInModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$GoogleLogInModelToJson(_GoogleLogInModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
    };
