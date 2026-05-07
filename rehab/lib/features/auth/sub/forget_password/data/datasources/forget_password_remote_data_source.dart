import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseForgetPasswordRemoteDataSource {
  Future<void> sendResetPasswordEmail(String email);
}

@LazySingleton(as: BaseForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSource implements BaseForgetPasswordRemoteDataSource {
  final SupabaseClient _supabase;

  ForgetPasswordRemoteDataSource(this._supabase);

  @override
  Future<void> sendResetPasswordEmail(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(email);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}