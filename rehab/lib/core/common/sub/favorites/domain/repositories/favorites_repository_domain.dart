import 'package:rehab/core/exports/app_exports.dart';

abstract class FavoritesRepositoryDomain {
  Future<Result<void, Failure>> toggleFavorite({required int homeId});

  Future<Result<List<FavoritesEntity>, Failure>> getFavorites();

  Future<Result<bool, Failure>> isFavorite({required int homeId});

  Future<Result<List<HomeEntity>, Failure>> getFavoriteHomes();
}
