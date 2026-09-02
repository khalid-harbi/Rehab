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
      final response = await _supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );

      // كان `single()` يرمي استثناءً حين لا صف في `profiles` — وهذه حال كل
      // حساب أُنشئ قبل إصلاح التسجيل. فتنجح المصادقة ثم يفشل تسجيل الدخول
      // برسالة خطأ تقنية، ويصير الحساب غير قابل للاستخدام نهائيًا.
      // `maybeSingle` يرجع null، ونعامل الدور المفقود كمستخدمة عادية.
      final data = await _supabase
          .from('profiles')
          .select('role')
          .eq('id', response.user!.id)
          .maybeSingle();

      final role = data?['role'] as String?;

      return role?.toUserRole() ?? UserRole.user;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
