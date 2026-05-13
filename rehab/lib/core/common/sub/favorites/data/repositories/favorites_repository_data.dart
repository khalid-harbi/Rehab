import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/common/sub/favorites/data/datasources/favorites_remote_data_source.dart';
import 'package:rehab/core/common/sub/favorites/data/models/favorites_model.dart';
import 'package:rehab/core/common/sub/favorites/domain/entities/favorites_entity.dart';
import 'package:rehab/core/common/sub/favorites/domain/repositories/favorites_repository_domain.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

@LazySingleton(as: FavoritesRepositoryDomain)
class FavoritesRepositoryData implements FavoritesRepositoryDomain {
  final BaseFavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<FavoritesEntity>, Failure>>
      getFavorites() async {
    try {
      final response =
          await remoteDataSource.getFavorites();

      return Success(
        response
            .map(
              (favorite) => favorite.toEntity(),
            )
            .toList(),
      );
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<void, Failure>> toggleFavorite({
    required int homeId,
  }) async {
    try {
      await remoteDataSource.toggleFavorite(
        homeId: homeId,
      );

      return const Success(null);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }

  @override
  Future<Result<bool, Failure>> isFavorite({
    required int homeId,
  }) async {
    try {
      final response = await remoteDataSource
          .isFavorite(homeId: homeId);

      return Success(response);
    } catch (error) {
      return Error(
        FailureExceptions.getException(error),
      );
    }
  }
}