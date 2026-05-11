import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home_details/domain/entities/home_details_entity.dart';
import 'package:rehab/features/home_details/domain/repositories/home_details_repository_domain.dart';


@lazySingleton
class HomeDetailsUseCase {
  final HomeDetailsRepositoryDomain _repositoryData;

  HomeDetailsUseCase(this._repositoryData);

   Future<Result<HomeDetailsEntity, Failure>> getHomeDetails() async {
    return _repositoryData.getHomeDetails();
  }
}
