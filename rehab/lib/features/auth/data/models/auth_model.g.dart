// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  isLogin: json['isLogin'] as bool? ?? false,
  isUser: json['isUser'] as bool?,
  role: json['role'] as String?,
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{
      'isLogin': instance.isLogin,
      'isUser': instance.isUser,
      'role': instance.role,
    };
