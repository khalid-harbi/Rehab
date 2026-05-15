import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/otp/data/datasources/otp_remote_data_source.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';

@LazySingleton(as: LogInWithOtpRepositoryDomain)
class LogInWithOtpRepositoryData implements LogInWithOtpRepositoryDomain {
  final BaseLogInWithOtpRemoteDataSource remoteDataSource;

  LogInWithOtpRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getLogInWithOtp({required String email}) async {
    try {
      await remoteDataSource.getLogInWithOtp(email: email);
      return Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
