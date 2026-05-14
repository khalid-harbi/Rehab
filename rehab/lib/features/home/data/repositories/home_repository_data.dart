import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

import 'package:rehab/features/home/data/datasources/home_remote_data_source.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/features/home/domain/repositories/home_repository_domain.dart';

@LazySingleton(as: HomeRepositoryDomain)
class HomeRepositoryData implements HomeRepositoryDomain {
  final BaseHomeRemoteDataSource remoteDataSource;

  HomeRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HomeEntity>, Failure>> getHome() async {
    try {
      final List<HomeModel> models = await remoteDataSource.getHome();

      final List<HomeEntity> entities = models
          .map((model) => model.toEntity())
          .toList();

      return Success(entities);
    } on Failure catch (failure) {
      return Error(failure);
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
}
