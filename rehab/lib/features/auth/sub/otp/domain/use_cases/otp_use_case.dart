import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/otp/domain/repositories/otp_repository_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@lazySingleton
class OtpUseCase {
  final OtpRepositoryDomain _repository;

  OtpUseCase(this._repository);

  Future<Result<Unit, Failure>> sendOtp(String email) async {
    return await _repository.sendOtp(email);
  }

  Future<Result<AuthResponse, Failure>> verifyOtp(
    String email,
    String token,
  ) async {
    return await _repository.verifyOtp(email: email, token: token);
  }
}
