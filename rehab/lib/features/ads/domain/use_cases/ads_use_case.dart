import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';
import 'package:rehab/features/ads/domain/repositories/ads_repository_domain.dart';

@lazySingleton
class AdsUseCase {
  final AdsRepositoryDomain _repositoryData;

  AdsUseCase(this._repositoryData);

  Future<Result<List<AdEntity>, Failure>> getAds() async {
    return _repositoryData.getAds();
  }
}
