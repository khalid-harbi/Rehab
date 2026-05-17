import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/otp/data/datasources/otp_remote_data_source.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';

@LazySingleton(as: OtpRepositoryDomain)
class OtpRepositoryData implements OtpRepositoryDomain {
  final BaseOtpRemoteDataSource _remoteDataSource;

  OtpRepositoryData(this._remoteDataSource);

  @override
  Future<Result<bool, Failure>> verifyOtp({
    required String email,
    required String token,
  }) async {
    try {
      final result = await _remoteDataSource.verifyOtp(
        email: email,
        token: token,
      );

      return Success(result);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<bool, Failure>> resendOtp({required String email}) async {
    try {
      final result = await _remoteDataSource.resendOtp(email: email);

      return Success(result);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
