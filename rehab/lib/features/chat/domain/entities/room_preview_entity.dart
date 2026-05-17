import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class RoomPreviewEntity extends Equatable {
  final types.Room room;
  final String displayName;
  final String? lastMessage;
  final String? avatarUrl;

  const RoomPreviewEntity({
    required this.room,
    required this.displayName,
    required this.lastMessage,
    this.avatarUrl,
  });

  @override
  List<Object?> get props => [room, displayName, lastMessage];
}
