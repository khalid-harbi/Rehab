import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitialState()) {
    getProfileMethod();
  }

  Future<void> getProfileMethod() async {
    emit(ProfileLoadingState());
    final result = await _profileUseCase.getProfile();
    result.when(
      (success) {
        emit(ProfileSuccessState(profile: success));
      },
      (whenError) {
        emit(ProfileErrorState(message: whenError.message));
      },
    );
  }
}
