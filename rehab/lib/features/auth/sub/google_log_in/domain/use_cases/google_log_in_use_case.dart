import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/entities/google_log_in_entity.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/repositories/google_log_in_repository_domain.dart';

@lazySingleton
class GoogleLogInUseCase {
  final GoogleLogInRepositoryDomain _repositoryData;

  GoogleLogInUseCase(this._repositoryData);

  Future<Result<GoogleLogInEntity, Failure>> getGoogleLogIn() async {
    return _repositoryData.getGoogleLogIn();
  }
}
