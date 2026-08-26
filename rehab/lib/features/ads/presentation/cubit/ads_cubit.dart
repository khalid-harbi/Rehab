import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/ads/domain/use_cases/ads_use_case.dart';
import 'package:rehab/features/ads/presentation/cubit/ads_state.dart';

@injectable
class AdsCubit extends Cubit<AdsState> {
  final AdsUseCase _adsUseCase;

  AdsCubit(this._adsUseCase) : super(AdsInitialState());

  Future<void> getAdsMethod() async {
    emit(AdsLoadingState());

    final result = await _adsUseCase.getAds();

    if (isClosed) return;

    result.when(
      (success) {
        emit(AdsSuccessState(ads: success));
      },
      (whenError) {
        emit(AdsErrorState(message: whenError.message));
      },
    );
  }
}
