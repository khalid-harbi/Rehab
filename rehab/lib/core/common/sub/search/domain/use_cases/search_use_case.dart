import 'package:rehab/core/exports/app_exports.dart';

@lazySingleton
class SearchUseCase {
  final SearchRepositoryDomain _repositoryData;

  SearchUseCase(this._repositoryData);

  Future<Result<List<HomeEntity>, Failure>> search({
    required String title,
  }) async {
    return await _repositoryData.search(title: title);
  }

  Future<Result<List<HomeEntity>, Failure>> filter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  }) async {
    return _repositoryData.filter(
      minPrice: minPrice,
      maxPrice: maxPrice,
      city: city,
      minRating: minRating,
      maxRating: maxRating,
      rooms: rooms,
      bathrooms: bathrooms,
    );
  }

  Future<Result<List<HomeEntity>, Failure>> getNearbyHomes(
    double lat,
    double lng,
  ) async {
    return _repositoryData.getNearbyHomes(lat, lng);
  }
}
