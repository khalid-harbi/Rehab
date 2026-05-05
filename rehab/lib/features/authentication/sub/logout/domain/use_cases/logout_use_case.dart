import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/logout/domain/repositories/logout_repository_domain.dart';

@lazySingleton
class LogoutUseCase {
  final LogoutRepositoryDomain _repositoryData;

  LogoutUseCase(this._repositoryData);

  Future<Result<void, Failure>> getLogout() async {
    return _repositoryData.getLogout();
  }
}
