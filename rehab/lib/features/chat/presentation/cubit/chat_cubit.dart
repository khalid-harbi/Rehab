import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/chat/domain/use_cases/chat_use_case.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUseCase _chatUseCase;

  ChatCubit(this._chatUseCase) : super(ChatInitialState());

  // ===================================================================
  // ===================================================================

  Future<void> fetchRooms() async {
    // Loading
    emit(ChatLoadingState());

    final result = await _chatUseCase.getRoomPreviews();
    // -----------------
    result.when(
      (roomPreviews) => emit(ChatLoadedState(roomPreviews: roomPreviews)),
      (failure) => emit(ChatErrorState(message: failure.message)),
    );
  }

  // ===================================================================
  // ===================================================================

  Future<void> hideRoomForCurrentUser(String roomId) async {
    final result = await _chatUseCase.hideRoomForCurrentUser(roomId);
    // -----------------
    result.when(
      (_) => fetchRooms(),
      (failure) => emit(ChatErrorState(message: failure.message)),
    );
  }
}
