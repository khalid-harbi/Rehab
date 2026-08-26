import 'package:rehab/core/exports/app_exports.dart';

abstract class SearchRepositoryDomain {
  Future<Result<List<HomeEntity>, Failure>> search({required String title});
  Future<Result<List<HomeEntity>, Failure>> filter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  });
  Future<Result<List<HomeEntity>, Failure>> getNearbyHomes(
    double lat,
    double lng,
  );
}
