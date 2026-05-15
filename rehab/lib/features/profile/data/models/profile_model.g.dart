// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(
  Map<String, dynamic> json,
) => _ProfileModel(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl:
      json['image_url'] as String? ??
      'https://ui-avatars.com/api/?name=Placeholder&background=random&length=1',
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt.toIso8601String(),
    };
