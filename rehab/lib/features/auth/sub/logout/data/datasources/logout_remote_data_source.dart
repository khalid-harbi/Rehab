import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLogoutRemoteDataSource {
  Future<void> getLogout();
}

@LazySingleton(as: BaseLogoutRemoteDataSource)
class LogoutRemoteDataSource implements BaseLogoutRemoteDataSource {
  final SupabaseClient _supabase;

  LogoutRemoteDataSource(this._supabase);

  @override
  Future<void> getLogout() async {
    try {
      await _supabase.auth.signOut();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
