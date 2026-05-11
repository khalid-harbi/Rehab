import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';

part 'room_preview_model.freezed.dart';
part 'room_preview_model.g.dart';

@freezed
abstract class RoomPreviewModel with _$RoomPreviewModel {
  const factory RoomPreviewModel({
    required types.Room room,
    required String displayName,
    required String? lastMessage,
  }) = _RoomPreviewModel;

  factory RoomPreviewModel.fromJson(Map<String, Object?> json) =>
      _$RoomPreviewModelFromJson(json);
}

extension RoomPreviewModelMapper on RoomPreviewModel {
  RoomPreviewEntity toEntity() {
    return RoomPreviewEntity(
      room: room,
      displayName: displayName,
      lastMessage: lastMessage,
    );
  }
}
