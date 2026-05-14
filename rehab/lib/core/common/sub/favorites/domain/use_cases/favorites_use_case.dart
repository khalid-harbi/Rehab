import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/common/sub/favorites/domain/entities/favorites_entity.dart';
import 'package:rehab/core/common/sub/favorites/domain/repositories/favorites_repository_domain.dart';


@lazySingleton
class FavoritesUseCase {
  final FavoritesRepositoryDomain _repositoryData;

  FavoritesUseCase(this._repositoryData);

   Future<Result<List<FavoritesEntity>, Failure>> getFavorites() async {
    return _repositoryData.getFavorites();
  }

  Future<Result<void, Failure>> toggleFavorite({
  required int homeId,
}) async {
  return _repositoryData.toggleFavorite(
    homeId: homeId,
  );
}

Future<Result<bool, Failure>> isFavorite({
  required int homeId,
}) async {
  return _repositoryData.isFavorite(
    homeId: homeId,
  );
}
}
