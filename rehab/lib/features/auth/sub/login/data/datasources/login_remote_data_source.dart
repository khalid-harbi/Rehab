import 'package:injectable/injectable.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/extensions/user_role_extension.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLoginRemoteDataSource {
  Future<UserRole> getLogin({required String email, required String password});
}

@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  final SupabaseClient _supabase;

  LoginRemoteDataSource(this._supabase);

  @override
  Future<UserRole> getLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(password: password, email: email);
      // todo: add role
       final data = await _supabase
          .from('profiles')
          .select('role')
          .eq('id', response.user!.id)
          .single();

      return (data['role'] as String).toUserRole();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
