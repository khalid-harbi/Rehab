import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/auth/sub/otp/domain/use_cases/otp_use_case.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_state.dart';

class LogInWithOtpCubit extends Cubit<LogInWithOtpState> {
  final LogInWithOtpUseCase _logInWithOtpUseCase;

  LogInWithOtpCubit(this._logInWithOtpUseCase) : super(LogInWithOtpInitialState());

  Future<void> getLogInWithOtpMethod({required String email}) async {
    final result = await _logInWithOtpUseCase.getLogInWithOtp(email:email);
    result.when(
      (success) {
       emit(LogInWithOtpSuccessState());
      },
      (whenError) {
     emit(LogInWithOtpErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
