import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';

@lazySingleton
class OtpUseCase {
  final OtpRepositoryDomain _repositoryData;

  OtpUseCase(this._repositoryData);

  Future<Result<bool, Failure>> verifyOtp({
    required String email,
    required String token,
  }) {
    return _repositoryData.verifyOtp(email: email, token: token);
  }

  Future<Result<bool, Failure>> resendOtp({required String email}) {
    return _repositoryData.resendOtp(email: email);

  }
}
