import 'package:rehab/core/exports/app_exports.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesUseCase _favoritesUseCase;

  FavoritesCubit(this._favoritesUseCase) : super(FavoritesInitialState());

  Future<void> toggleFavorite({required int homeId}) async {
    final result = await _favoritesUseCase.toggleFavorite(homeId: homeId);

    result.when(
      (success) async {
        await checkFavorite(homeId: homeId);
      },
      (whenError) {
        emit(FavoritesErrorState(message: whenError.message));
      },
    );
  }

  Future<void> checkFavorite({required int homeId}) async {
    final result = await _favoritesUseCase.isFavorite(homeId: homeId);

    result.when(
      (success) {
        emit(FavoritesSuccessState(isFavorite: success, homeId: homeId));
      },
      (whenError) {
        emit(FavoritesErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
