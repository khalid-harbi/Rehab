import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/login/domain/entities/login_entity.dart';
import 'package:rehab/features/authentication/sub/login/domain/repositories/login_repository_domain.dart';


@lazySingleton
class LoginUseCase {
  final LoginRepositoryDomain _repositoryData;

  LoginUseCase(this._repositoryData);

   Future<Result<LoginEntity, Failure>> getLogin() async {
    return _repositoryData.getLogin();
  }
}
