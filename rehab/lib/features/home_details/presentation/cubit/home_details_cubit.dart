import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/home_details/domain/use_cases/home_details_use_case.dart';
import 'package:rehab/features/home_details/presentation/cubit/home_details_state.dart';

class HomeDetailsCubit extends Cubit<HomeDetailsState> {
  final HomeDetailsUseCase _homeDetailsUseCase;

  HomeDetailsCubit(this._homeDetailsUseCase) : super(HomeDetailsInitialState());

  Future<void> getHomeDetailsMethod() async {
    final result = await _homeDetailsUseCase.getHomeDetails();
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
