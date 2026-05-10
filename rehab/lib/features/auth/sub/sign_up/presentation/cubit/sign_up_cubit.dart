import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/auth/sub/sign_up/domain/use_cases/sign_up_use_case.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final SignUpUseCase _signUpUseCase;

  SignUpCubit(this._signUpUseCase) : super(SignUpInitialState());

  Future<void> getSignUpMethod({
    required String username,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    final result = await _signUpUseCase.getSignUp(
      email: email,
      password: password,
      name: username,
    );
    result.when(
      (success) {
        emit(SignUpSuccessState());
      },
      (whenError) {
        emit(SignUpErrorState(message: whenError.message));
      },
    );
  }
}
