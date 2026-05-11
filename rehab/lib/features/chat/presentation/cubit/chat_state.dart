import 'package:equatable/equatable.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object?> get props => [];
}

// ===================================================================
// ===================================================================

class ChatInitialState extends ChatState {}

// ===================================================================
// ===================================================================

class ChatSuccessState extends ChatState {}

// ===================================================================
// ===================================================================

class ChatLoadingState extends ChatState {}

// ===================================================================
// ===================================================================

class ChatErrorState extends ChatState {
  final String message;
  const ChatErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

// ===================================================================
// ===================================================================

class ChatLoadedState extends ChatState {
  final List<RoomPreviewEntity> roomPreviews;
  const ChatLoadedState({required this.roomPreviews});
  @override
  List<Object?> get props => [roomPreviews];
}

// ===================================================================
// ===================================================================
