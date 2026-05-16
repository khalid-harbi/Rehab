import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/auth/sub/google_log_in/data/models/google_log_in_model.dart';

abstract class BaseGoogleLogInRemoteDataSource {
  Future<GoogleLogInModel> getGoogleLogIn();
}

@LazySingleton(as: BaseGoogleLogInRemoteDataSource)
class GoogleLogInRemoteDataSource implements BaseGoogleLogInRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  final GoogleSignIn _googleSignIn;

  GoogleLogInRemoteDataSource(
    this._localKeysService,
    this._supabase,
    this._googleSignIn,
  );

  @override
  Future<GoogleLogInModel> getGoogleLogIn() async {
    final googleAccount = await _googleSignIn.authenticate();
    final googleAuthorization = await googleAccount.authorizationClient
        .authorizationForScopes(['email', 'profile']);
    final googleAuthentication = googleAccount.authentication;
    final idToken = googleAuthentication.idToken;
    final accessToken = googleAuthorization?.accessToken;

    if (idToken == null) {
      throw 'No ID Token found.';
    }

    await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final userInfo = await insertOrGetUser(
      authId: _supabase.auth.currentUser!.id,
      name: googleAccount.displayName ?? 'Name',
      email: googleAccount.email,
      imageUrl: googleAccount.photoUrl,
    );

    return GoogleLogInModel(
      id: userInfo['id'],
      name: userInfo['name'],
      email: userInfo['email'],
      imageUrl: userInfo['image_url'],
    );
  }

  Future<Map<String, dynamic>> insertOrGetUser({
    required String authId,
    required String name,
    required String email,
    String? imageUrl,
  }) async {
    Map<String, dynamic>? response = await _supabase
        .from('profiles')
        .select()
        .eq('auth_id', authId)
        .maybeSingle();
    if (response == null) {
      final insertResponse = await _supabase
          .from('profiles')
          .insert({
            'auth_id': authId,
            'name': name,
            'email': email,
            'image_url': imageUrl,
          })
          .select()
          .single();
      return insertResponse;
    }
    return response;
  }
}
