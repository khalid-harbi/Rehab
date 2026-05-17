import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/user_details/domain/use_cases/user_details_use_case.dart';
import 'package:rehab/features/user_details/presentation/cubit/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  final UserDetailsUseCase _userDetailsUseCase;

  UserDetailsCubit(this._userDetailsUseCase) : super(UserDetailsInitialState());

  Future<void> getUserDetailsMethod() async {
    final result = await _userDetailsUseCase.getUserDetails();
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
