import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/use_cases/google_log_in_use_case.dart';
import 'package:rehab/features/auth/sub/google_log_in/presentation/cubit/google_log_in_state.dart';

class GoogleLogInCubit extends Cubit<GoogleLogInState> {
  final GoogleLogInUseCase _googleLogInUseCase;

  GoogleLogInCubit(this._googleLogInUseCase) : super(GoogleLogInInitialState());

  Future<void> getGoogleLogInMethod() async {
    emit(GoogleLogLoadingState());
    final result = await _googleLogInUseCase.getGoogleLogIn();
    result.when(
      (success) {
        emit(GoogleLogInSuccessState());
      },
      (whenError) {
        emit(GoogleLogInErrorState(message: whenError.message));
      },
    );
  }
}
