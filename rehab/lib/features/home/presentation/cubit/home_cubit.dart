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

  Future<void> applyFilter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  }) async {
    emit(HomeLoadingState());

    final result = await _homeUseCase.filter(
      minPrice: minPrice,
      maxPrice: maxPrice,
      city: city,
      minRating: minRating,
      rooms: rooms,
      bathrooms: bathrooms,
    );

    result.when(
      (success) {
        emit(HomeSuccessState(success));
      },
      (error) {
        emit(HomeErrorState(error.message));
      },
    );
  }
}
