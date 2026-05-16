import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';

abstract class OtpRepositoryDomain {
  Future<Result<bool, Failure>> verifyOtp({
    required String email,
    required String token,
  });

  Future<Result<bool, Failure>> resendOtp({required String email});
}
