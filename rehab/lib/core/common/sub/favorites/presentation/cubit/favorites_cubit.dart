import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/common/sub/favorites/domain/use_cases/favorites_use_case.dart';
import 'package:rehab/core/common/sub/favorites/presentation/cubit/favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesUseCase _favoritesUseCase;

  FavoritesCubit(this._favoritesUseCase) : super(FavoritesInitialState());

Future<void> toggleFavorite({
  required int homeId,
}) async {
  final result = await _favoritesUseCase
      .toggleFavorite(homeId: homeId);

  result.when(
    (success) async {
      await checkFavorite(homeId: homeId);
    },
    (whenError) {
      emit(
        FavoritesErrorState(
          message: whenError.message,
        ),
      );
    },
  );
}

  Future<void> checkFavorite({
  required int homeId,
}) async {
  final result = await _favoritesUseCase
      .isFavorite(homeId: homeId);

  result.when(
    (success) {
      emit(
        FavoritesSuccessState(
          isFavorite: success, homeId: homeId,
        ),
      );
    },
    (whenError) {
      emit(
        FavoritesErrorState(
          message: whenError.message,
        ),
      );
    },
  );
}



  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
