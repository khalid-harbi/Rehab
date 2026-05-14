import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/home/domain/repositories/home_repository_domain.dart';

@lazySingleton
class HomeUseCase {
  final HomeRepositoryDomain _repositoryData;

  HomeUseCase(this._repositoryData);

  Future<Result<List<HomeEntity>, Failure>> getHome() async {
    return _repositoryData.getHome();
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
}
