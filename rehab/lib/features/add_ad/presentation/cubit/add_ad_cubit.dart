import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/add_ad/domain/use_cases/add_ad_use_case.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_state.dart';

class AddAdCubit extends Cubit<AddAdState> {
  final AddAdUseCase _addAdUseCase;

  AddAdCubit(this._addAdUseCase) : super(AddAdInitialState());

  Future<void> getAddAdMethod() async {
    final result = await _addAdUseCase.getAddAd();
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
