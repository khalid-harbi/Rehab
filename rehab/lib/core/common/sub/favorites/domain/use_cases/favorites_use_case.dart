import 'package:rehab/core/exports/app_exports.dart';

@lazySingleton
class FavoritesUseCase {
  final FavoritesRepositoryDomain _repositoryData;

  FavoritesUseCase(this._repositoryData);

  Future<Result<List<FavoritesEntity>, Failure>> getFavorites() async {
    return _repositoryData.getFavorites();
  }

  Future<Result<void, Failure>> toggleFavorite({required int homeId}) async {
    return _repositoryData.toggleFavorite(homeId: homeId);
  }

  Future<Result<bool, Failure>> isFavorite({required int homeId}) async {
    return _repositoryData.isFavorite(homeId: homeId);
  }
}
