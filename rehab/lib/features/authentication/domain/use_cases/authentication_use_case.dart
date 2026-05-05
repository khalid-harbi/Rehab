import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/domain/entities/authentication_entity.dart';
import 'package:rehab/features/authentication/domain/repositories/authentication_repository_domain.dart';


@lazySingleton
class AuthUseCase {
  final AuthRepositoryDomain _repositoryData;

  AuthUseCase(this._repositoryData);

  Future<Result<AuthEntity, Failure>> getAuth() async {
    return _repositoryData.checkStatus();
  }
}
