import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/owner/domain/use_cases/owner_use_case.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_state.dart';

class OwnerCubit extends Cubit<OwnerState> {
  final OwnerUseCase _ownerUseCase;

  OwnerCubit(this._ownerUseCase) : super(OwnerInitialState());

  Future<void> getOwnerMethod() async {
    final result = await _ownerUseCase.getOwner();
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
