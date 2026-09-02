import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/auth/sub/otp/domain/use_cases/otp_use_case.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpUseCase _otpUseCase;

  OtpCubit(this._otpUseCase) : super(OtpInitialState());

  /// التحقق من الرمز.
  ///
  /// كانت النتيجة تُنتظر ثم تُهمل: لا `result.when` ولا إصدار حالة بعدها.
  /// فالشاشة تدخل `OtpLoadingState` ولا تخرج منه أبدًا — لا نجاح ولا خطأ،
  /// مؤشّر تحميل لا نهائي مهما كان الرمز صحيحًا.
  Future<void> verifyOtpMethod({
    required String email,
    required String token,
  }) async {
    emit(OtpLoadingState());

    final result = await _otpUseCase.verifyOtp(email: email, token: token);

    result.when(
      (success) {
        emit(OtpSuccessState());
      },
      (failure) {
        emit(OtpErrorState(message: failure.message));
      },
    );
  }

  /// إعادة إرسال الرمز.
  ///
  /// كانت هذه الدالة معرّفة **داخل** `verifyOtpMethod` كدالة محلية، فلا
  /// يمكن استدعاؤها من خارجها إطلاقًا — ولهذا كان سطر استدعائها في الشاشة
  /// معلّقًا، وزر «Resend Code» بلا أي وظيفة.
  Future<void> resendOtpMethod({required String email}) async {
    emit(OtpLoadingState());

    final result = await _otpUseCase.resendOtp(email: email);

    result.when(
      (success) {
        emit(OtpResendSuccessState());
      },
      (failure) {
        emit(OtpErrorState(message: failure.message));
      },
    );
  }
}
