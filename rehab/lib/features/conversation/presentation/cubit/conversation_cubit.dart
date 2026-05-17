import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:rehab/features/conversation/domain/use_cases/conversation_use_case.dart';
import 'package:rehab/features/conversation/presentation/cubit/conversation_state.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

class ConversationCubit extends Cubit<ConversationState> {
  final ConversationUseCase _conversationUseCase;
  StreamSubscription<List<types.Message>>? _messagesSubscription;

  ConversationCubit(this._conversationUseCase)
    : super(ConversationInitialState());

  // ===================================================================
  // ===================================================================

  Future<types.Room?> startChat(String otherUserId) async {
    final result = await _conversationUseCase.createRoom(otherUserId);

    return result.when(
      (room) {
        emit(ConversationSuccessState());
        listenToMessages(room); // Start listening to the stream
        return room;
      },
      (failure) {
        emit(ConversationErrorState(message: failure.message));
        return null;
      },
    );
  }

  // ===================================================================
  // ===================================================================

  void sendTextMessage(String text, String roomId) async {
    final result = await _conversationUseCase.sendMessage(text, roomId);
    result.when(
      (success) => null,
      (failure) => emit(ConversationErrorState(message: failure.message)),
    );
  }

  // ===================================================================
  // ===================================================================

  void listenToMessages(types.Room room) {
    _messagesSubscription?.cancel(); // Cancel the old one first

    _messagesSubscription = _conversationUseCase
        .getMessages(room)
        .listen(
          (messages) {
            emit(
              ConversationMessagesLoadedState(messages: List.from(messages)),
            );
          },
          onError: (error) {
            emit(ConversationErrorState(message: error.toString()));
          },
        );
  }

  // ===================================================================
  // ===================================================================

  Future<UsersEntity?> getUserById(String userId) async {
    final result = await _conversationUseCase.getUserById(userId);

    return result.when(
      (userEntity) {
        // We don't emit a success state here so we don't clear out
        // the ConversationMessagesLoadedState on the current chat screen UI
        return userEntity;
      },
      (failure) {
        emit(ConversationErrorState(message: failure.message));
        return null;
      },
    );
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<void> close() {
    // for better performance
    _messagesSubscription?.cancel();
    return super.close();
  }
}
