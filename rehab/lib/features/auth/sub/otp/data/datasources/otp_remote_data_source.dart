//todo edit the execptio with failure file gahyda

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseOtpRemoteDataSource {
  Future<bool> verifyOtp({required String email, required String token});
  Future<bool> resendOtp({required String email});
}

@LazySingleton(as: BaseOtpRemoteDataSource)
class OtpRemoteDataSource implements BaseOtpRemoteDataSource {
  final SupabaseClient _supabase;

  OtpRemoteDataSource(this._supabase);

  @override
  Future<bool> verifyOtp({required String email, required String token}) async {
    try {
      final AuthResponse response = await _supabase.auth.verifyOTP(
        email: email,
        token: token,
        type: OtpType.signup,
      );

      return response.user != null;
    } on AuthException catch (e) {
      throw AuthException(e.message, statusCode: e.statusCode);
    } catch (e) {
      throw Exception(e);
      // todo: replace it with failure
    }
  }

  @override
  Future<bool> resendOtp({required String email}) async {
    try {
      await _supabase.auth.resend(type: OtpType.signup, email: email);
      return true;
    } on AuthException catch (e) {
      throw AuthException(e.message, statusCode: e.statusCode);
    } catch (e) {
      throw Exception(e);

    }
  }
}
