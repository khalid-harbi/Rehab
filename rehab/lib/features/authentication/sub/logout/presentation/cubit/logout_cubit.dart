import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/authentication/sub/logout/domain/use_cases/logout_use_case.dart';
import 'package:rehab/features/authentication/sub/logout/presentation/cubit/logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final LogoutUseCase _logoutUseCase;

  LogoutCubit(this._logoutUseCase) : super(LogoutInitialState());

  Future<void> getLogoutMethod() async {
    final result = await _logoutUseCase.getLogout();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
