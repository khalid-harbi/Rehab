import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/ads/data/datasources/ads_remote_data_source.dart';
import 'package:rehab/features/ads/data/models/ad_model.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';
import 'package:rehab/features/ads/domain/repositories/ads_repository_domain.dart';

@LazySingleton(as: AdsRepositoryDomain)
class AdsRepositoryData implements AdsRepositoryDomain {
  final BaseAdsRemoteDataSource remoteDataSource;

  AdsRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<AdEntity>, Failure>> getAds() async {
    try {
      final List<AdModel> models = await remoteDataSource.getAds();

      final List<AdEntity> entities = models
          .map((model) => model.toEntity())
          .toList();

      return Success(entities);
    } on Failure catch (failure) {
      return Error(failure);
    }
  }
}
