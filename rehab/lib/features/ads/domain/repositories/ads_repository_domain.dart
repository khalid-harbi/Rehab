import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/ads/domain/entities/ad_entity.dart';

abstract class AdsRepositoryDomain {
  Future<Result<List<AdEntity>, Failure>> getAds();
}
