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

      return AuthModel(isLogin: true, isUser: true, role: await _role(user.id));
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  /// دور المستخدمة من `profiles`.
  ///
  /// `maybeSingle` لا `single`: الحسابات التي أُنشئت قبل إصلاح التسجيل لا صف
  /// لها، و`single` كان يرمي استثناءً فتتحوّل شاشة السبلاش إلى خطأ.
  /// فشل قراءة الدور وحده لا يمنع الدخول — نرجع null وتُعامل كمستخدمة عادية.
  Future<String?> _role(String userId) async {
    try {
      final profile = await _supabase
          .from('profiles')
          .select('role')
          .eq('id', userId)
          .maybeSingle();

      return profile?['role'] as String?;
    } catch (_) {
      return null;
    }
  }
}
