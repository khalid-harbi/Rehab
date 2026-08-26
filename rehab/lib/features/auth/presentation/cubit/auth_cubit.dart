import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/auth/domain/use_cases/auth_use_case.dart';
import 'package:rehab/features/auth/presentation/cubit/auth_state.dart';

@injectable
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
