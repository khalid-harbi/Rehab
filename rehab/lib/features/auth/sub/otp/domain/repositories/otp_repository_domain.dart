import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class OtpRepositoryDomain {
Future<Result<Unit, Failure>> sendOtp(String email);

  Future<Result<AuthResponse, Failure>> verifyOtp({
    required String email, 
    required String token,
  });}
