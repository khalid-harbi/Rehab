import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/data/models/auth_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseAuthRemoteDataSource {
  Future<AuthModel> checkStatus();
}

@LazySingleton(as: BaseAuthRemoteDataSource)
class AuthRemoteDataSource implements BaseAuthRemoteDataSource {
  final SupabaseClient _supabase;

  AuthRemoteDataSource(this._supabase);

  @override
  Future<AuthModel> checkStatus() async {
    try {
      final session = _supabase.auth.currentSession;

      if (session == null) {
        return AuthModel(isLogin: false, isUser: false);
      }

      if (session.isExpired) {
        await _supabase.auth.refreshSession(session.refreshToken);
      }

      final user = _supabase.auth.currentUser;

      if (user == null) {
        return AuthModel(isLogin: false, isUser: false);
      }

      if (user.isAnonymous) {
        return AuthModel(isLogin: true, isUser: false);
      }

      return AuthModel(isLogin: true, isUser: true);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  Future<void> restAuth() async {
    if (_supabase.auth.currentSession == null) {
      await _supabase.auth.signInAnonymously();
    }

    if (_supabase.auth.currentSession!.isExpired) {
      await _supabase.auth.refreshSession(
        _supabase.auth.currentSession!.refreshToken,
      );
    }
  }
}
