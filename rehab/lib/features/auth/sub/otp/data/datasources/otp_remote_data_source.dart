import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLogInWithOtpRemoteDataSource {
  Future<void> getLogInWithOtp({required String email});
}

@LazySingleton(as: BaseLogInWithOtpRemoteDataSource)
class LogInWithOtpRemoteDataSource implements BaseLogInWithOtpRemoteDataSource {
  final SupabaseClient _supabase;

  LogInWithOtpRemoteDataSource(this._supabase);

  @override
  Future<void> getLogInWithOtp({required String email}) async {
    try {
      await _supabase.auth.signInWithOtp(email: email, shouldCreateUser: false);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
