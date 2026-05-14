import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';
import 'package:rehab/features/add_ad/domain/repositories/add_ad_repository_domain.dart';


@lazySingleton
class AddAdUseCase {
  final AddAdRepositoryDomain _repositoryData;

  AddAdUseCase(this._repositoryData);

   Future<Result<AddAdEntity, Failure>> getAddAd() async {
    return _repositoryData.getAddAd();
  }
}
