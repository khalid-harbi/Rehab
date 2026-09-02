import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;

  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email,
        password: password,

        // كان الاسم يُستقبل ثم يُرمى: `signUp` بلا `data`، ولا إدخال في
        // `profiles`. فالحساب يُنشأ في `auth.users` فقط، ولا يصل شيء إلى
        // جدول بيانات التطبيق — فيظهر الاسم «زائر» ويبقى الحساب بلا دور.
        //
        // الاسم هنا يُحفظ في `raw_user_meta_data`، ومنه يقرأه الـ trigger
        // في supabase/profiles_on_signup.sql لينشئ صف `profiles`.
        data: {'name': name},
      );

      final user = authResponse.user;

      if (user == null) return false;

      await _ensureProfile(userId: user.id, name: name);

      return true;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  /// شبكة أمان للصف في `profiles`.
  ///
  /// الـ trigger في قاعدة البيانات هو المسار الأساسي — يعمل بـ security
  /// definer فلا توقفه RLS، ويغطّي حالة تفعيل تأكيد البريد (حيث لا جلسة بعد
  /// التسجيل، فلا يستطيع العميل الكتابة أصلًا).
  ///
  /// هذه المحاولة تغطّي قاعدة بيانات لم يُثبَّت فيها الـ trigger بعد.
  /// `upsert` لا `insert` حتى لا تتصادم مع صف أنشأه الـ trigger، وفشلها
  /// لا يُسقط التسجيل — الحساب أُنشئ فعلًا في `auth.users`.
  Future<void> _ensureProfile({
    required String userId,
    required String name,
  }) async {
    try {
      // id و name و role فقط: هي الأعمدة التي يقرأها التطبيق فعلًا
      // (ProfileModel و UsersModel). لا نكتب email لأن وجوده في المخطّط
      // غير مؤكّد، ولا شيء في التطبيق يقرأه.
      await _supabase
          .from('profiles')
          .upsert(
            {'id': userId, 'name': name, 'role': 'user'},
            onConflict: 'id',
            ignoreDuplicates: true,
          );
    } catch (_) {
      // الـ trigger مسؤول عن الصف؛ لا نُفشل التسجيل بسبب RLS.
    }
  }
}
