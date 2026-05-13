import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/common/sub/favorites/domain/entities/favorites_entity.dart';

abstract class FavoritesRepositoryDomain {

    Future<Result<void, Failure>> toggleFavorite({
    required int homeId,
  });
  
    Future<Result<List<FavoritesEntity>, Failure>> getFavorites();

      Future<Result<bool, Failure>> isFavorite({
    required int homeId,
  });
}
