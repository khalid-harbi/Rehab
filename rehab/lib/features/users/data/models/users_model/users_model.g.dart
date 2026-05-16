// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => _UsersModel(
  id: json['id'] as String,
  name: json['name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  imageUrl:
      json['image_url'] as String? ??
      'https://ui-avatars.com/api/?name=Placeholder&background=random&length=1',
  answers:
      (json['answers'] as List<dynamic>?)
          ?.map((e) => UserAnswersModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  matchPercentage: (json['match_percentage'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$UsersModelToJson(_UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_at': instance.createdAt.toIso8601String(),
      'image_url': instance.imageUrl,
      'answers': instance.answers,
      'match_percentage': instance.matchPercentage,
    };
