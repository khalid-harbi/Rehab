import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseOtpRemoteDataSource {
  Future<void> sendOtp(String email);
  Future<AuthResponse> verifyOtp({required String email, required String token});
}


@LazySingleton(as: BaseOtpRemoteDataSource)
class OtpRemoteDataSource implements BaseOtpRemoteDataSource {
 
  final SupabaseClient _supabase;

  
  

   OtpRemoteDataSource(this._supabase);



   
@override
Future<void> sendOtp(String email) async {
  try {
    await _supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
    );
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}

@override
Future<AuthResponse> verifyOtp({required String email, required String token}) async {
  try {
    return await _supabase.auth.verifyOTP(
      email: email,
      token: token,
      type: OtpType.magiclink,
    );
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}
}
