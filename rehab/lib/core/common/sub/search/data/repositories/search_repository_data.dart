import 'package:rehab/core/exports/app_exports.dart';

@LazySingleton(as: SearchRepositoryDomain)
class SearchRepositoryData implements SearchRepositoryDomain {
  final BaseSearchRemoteDataSource remoteDataSource;

  SearchRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HomeEntity>, Failure>> search({
    required String title,
  }) async {
    try {
      final response = await remoteDataSource.search(title: title);
      return Success(response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<HomeEntity>, Failure>> filter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  }) async {
    try {
      final List<HomeModel> models = await remoteDataSource.filter(
        minPrice: minPrice,
        maxPrice: maxPrice,
        city: city,
        minRating: minRating,
        maxRating: maxRating,
        rooms: rooms,
        bathrooms: bathrooms,
      );

      final List<HomeEntity> entities = models
          .map((model) => model.toEntity())
          .toList();

      return Success(entities);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
   @override
  Future<Result<List<HomeEntity>, Failure>> getNearbyHomes(double lat, double lng) async {
    try {
      final List<HomeModel> models = await remoteDataSource.getNearbyHomes(lat, lng);
      final List<HomeEntity> entities = models.map((model) => model.toEntity()).toList();
      return Success(entities);
    }on Failure catch (failure) {
      return Error(failure);
    }
  }
}
