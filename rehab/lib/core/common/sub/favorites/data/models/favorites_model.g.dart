// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) =>
    _FavoritesModel(
      id: (json['id'] as num).toInt(),
      userId: json['userId'] as String,
      homeId: (json['homeId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$FavoritesModelToJson(_FavoritesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'homeId': instance.homeId,
      'createdAt': instance.createdAt.toIso8601String(),
    };
