import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;

  ProfileRemoteDataSource(this._supabase);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final session = _supabase.auth.currentSession;
      if (session == null || session.isExpired) {
        throw const UnauthorizedFailure("Session expired or not logged in");
      }
      final response = await _supabase
          .from('profiles')
          .select()
          .eq('id', session.user.id)
          .maybeSingle();

      if (response == null) {
        return ProfileModel(
          id: session.user.id,
          name: "زائر",
          createdAt: DateTime.now(),
        );
      }
      return ProfileModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
