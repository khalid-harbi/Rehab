import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class ConversationState extends Equatable {
  const ConversationState();

  @override
  List<Object?> get props => [];
}

class ConversationInitialState extends ConversationState {}

class ConversationSuccessState extends ConversationState {}

class ConversationMessagesLoadedState extends ConversationState {
  final List<types.Message> messages;
  const ConversationMessagesLoadedState({required this.messages});
  @override
  List<Object?> get props => [messages];
}

class ConversationErrorState extends ConversationState {
  final String message;
  const ConversationErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
