// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_preview_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoomPreviewModel _$RoomPreviewModelFromJson(Map<String, dynamic> json) =>
    _RoomPreviewModel(
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
      displayName: json['displayName'] as String,
      lastMessage: json['lastMessage'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
    );

Map<String, dynamic> _$RoomPreviewModelToJson(_RoomPreviewModel instance) =>
    <String, dynamic>{
      'room': instance.room,
      'displayName': instance.displayName,
      'lastMessage': instance.lastMessage,
      'avatarUrl': instance.avatarUrl,
    };
