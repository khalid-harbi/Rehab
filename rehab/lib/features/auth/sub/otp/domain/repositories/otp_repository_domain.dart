import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';

abstract class LogInWithOtpRepositoryDomain {
  Future<Result<void, Failure>> getLogInWithOtp({required String email});
}
