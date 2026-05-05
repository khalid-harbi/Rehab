import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/authentication/domain/use_cases/authentication_use_case.dart';
import 'package:rehab/features/authentication/presentation/cubit/authentication_state.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthUseCase _authUseCase;

  AuthCubit(this._authUseCase) : super(AuthInitialState()) {
    getAuthMethod();
  }

  Future<void> getAuthMethod() async {
    final result = await _authUseCase.getAuth();
    result.when(
      (success) {
        emit(AuthSuccessState(isLogin: success.isLogin));
      },
      (whenError) {
        emit(AuthErrorState(message: whenError.message));
      },
    );
  }
}
