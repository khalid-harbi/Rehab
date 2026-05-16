import 'package:rehab/core/exports/app_exports.dart';

@LazySingleton(as: FavoritesRepositoryDomain)
class FavoritesRepositoryData implements FavoritesRepositoryDomain {
  final BaseFavoritesRemoteDataSource remoteDataSource;

  FavoritesRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<FavoritesEntity>, Failure>> getFavorites() async {
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

@override
Future<Result<List<HomeEntity>, Failure>> getFavoriteHomes() async {
  try {
    final response = await remoteDataSource.getFavoriteHomes();

    return Success(
      response.map((home) => home.toEntity()).toList(),
    );
  } catch (error) {
    return Error(
      FailureExceptions.getException(error),
    );
  }
}


}