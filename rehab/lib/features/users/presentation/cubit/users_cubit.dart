import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/users/domain/use_cases/users_use_case.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersUseCase _usersUseCase;

  UsersCubit(this._usersUseCase) : super(UsersInitialState()) {
    loadedUser();
  }
  // ===================================================================
  // ===================================================================

  Future<void> loadedUser() async {
    final result = await _usersUseCase.loadUsers();
    result.when(
      (success) {
        emit(UsersSuccessState(users: success));
      },
      (whenError) {
        emit(UsersErrorState(message: whenError.message));
      },
    );
  }

  // ===================================================================
  // ===================================================================

  Future<void> createRoom(String otherUserId) async {
    // loading state
    emit(UsersLoadingState());
    final result = await _usersUseCase.createRoom(otherUserId);
    // ----------------
    result.when(
      (room) => emit(UsersRoomCreatedState(room)),
      (error) => emit(UsersErrorState(message: error.toString())),
    );
  }
}
