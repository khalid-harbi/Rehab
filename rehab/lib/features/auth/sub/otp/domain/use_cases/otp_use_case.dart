import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';

@lazySingleton
class LogInWithOtpUseCase {
  final LogInWithOtpRepositoryDomain _repositoryData;

  LogInWithOtpUseCase(this._repositoryData);

  Future<Result<void, Failure>> getLogInWithOtp({required String email}) async {
    return _repositoryData.getLogInWithOtp(email: email);
  }
}
