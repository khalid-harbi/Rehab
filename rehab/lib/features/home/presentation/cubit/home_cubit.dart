import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/services/location_service.dart';
import 'package:rehab/features/home/domain/use_cases/home_use_case.dart';
import 'package:rehab/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeUseCase _homeUseCase;
  final BaseLocationService _locationService;
  HomeCubit(this._homeUseCase, this._locationService)
    : super(HomeInitialState());

  Future<void> getHomeMethod() async {
    emit(HomeLoadingState());
    final result = await _homeUseCase.getHome();

    result.when(
      (success) {
        emit(HomeSuccessState(success));
      },
      (whenError) {
        emit(HomeErrorState(message: whenError.message));
      },
    );
  }

  Future<void> openMapLocation(double lat, double lng) async {
    try {
      await _locationService.openMap(lat, lng);
    } catch (e) {
      emit(HomeErrorState(message: "تعذر فتح الخريطة"));
    }
  }

  //! todo: change error

  
}
