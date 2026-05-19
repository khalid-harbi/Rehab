import 'package:injectable/injectable.dart';
import 'package:rehab/features/home_details/domain/repositories/home_details_repository_domain.dart';


@lazySingleton
class HomeDetailsUseCase {
  final HomeDetailsRepositoryDomain _repositoryData;

  HomeDetailsUseCase(this._repositoryData);

  
}
