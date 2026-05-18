import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/user_details/domain/entities/user_details_entity.dart';
import 'package:rehab/features/user_details/domain/repositories/user_details_repository_domain.dart';


@lazySingleton
class UserDetailsUseCase {
  final UserDetailsRepositoryDomain _repositoryData;

  UserDetailsUseCase(this._repositoryData);

   Future<Result<UserDetailsEntity, Failure>> getUserDetails() async {
    return _repositoryData.getUserDetails();
  }
}
