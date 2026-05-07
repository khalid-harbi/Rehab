import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/auth/sub/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:rehab/features/auth/sub/forget_password/presentation/cubit/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase _useCase;

  ForgetPasswordCubit(this._useCase) : super(ForgetPasswordInitial());

  Future<void> sendResetPasswordEmail(String email) async {
    emit(ForgetPasswordLoading());

    final result = await _useCase.call(email);

    result.when(
      (success) {
        emit(ForgetPasswordSuccess());
      },
      (error) {
        emit(ForgetPasswordError(message: error.message));
      },
    );
  }
}