import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:rehab/features/home/domain/use_cases/home_use_case.dart';
import 'package:rehab/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;

  HomeCubit(this._homeUseCase) : super(HomeInitialState());

  Future<void> getHomeMethod() async {
    emit(HomeLoadingState());
    final result = await _homeUseCase.getHome();

    result.when(
      (success) {
        emit(HomeSuccessState(success));
      },
      (whenError) {
        emit(HomeErrorState(whenError.message));
      },
    );
  }
}
