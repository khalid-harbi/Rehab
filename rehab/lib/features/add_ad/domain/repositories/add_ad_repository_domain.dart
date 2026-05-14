import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';

abstract class AddAdRepositoryDomain {
    Future<Result<AddAdEntity, Failure>> getAddAd();
}
