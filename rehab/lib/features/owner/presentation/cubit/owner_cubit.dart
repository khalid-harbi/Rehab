import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/owner/domain/use_cases/owner_use_case.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';

class OwnerCubit extends Cubit<OwnerState> {
  final OwnerUseCase _ownerUseCase;

  OwnerCubit(this._ownerUseCase) : super(OwnerInitialState());
  Future<void> getOwnerMethod() async {
    emit(OwnerLoadingState());
    final result = await _ownerUseCase.getOwner();

    result.when(
      (success) {
        emit(OwnerSuccessState(owner: success));
      },
      (error) {
        emit(OwnerErrorState(message: error.message));
      },
    );
  }

  Future<void> getOwnerPropertiesMethod() async {
    emit(OwnerLoadingState());
    final result = _ownerUseCase.getOwnerProperties;

    result.when(
      (success) {
        emit(OwnerSuccessState(owner: success));
      },
      (error) {
        emit(OwnerErrorState(message: error.message));
      },
    );
  }
}
