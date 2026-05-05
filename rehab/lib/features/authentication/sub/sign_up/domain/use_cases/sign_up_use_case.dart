import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/sign_up/domain/entities/sign_up_entity.dart';
import 'package:rehab/features/authentication/sub/sign_up/domain/repositories/sign_up_repository_domain.dart';


@lazySingleton
class SignUpUseCase {
  final SignUpRepositoryDomain _repositoryData;

  SignUpUseCase(this._repositoryData);

   Future<Result<SignUpEntity, Failure>> getSignUp() async {
    return _repositoryData.getSignUp();
  }
}
