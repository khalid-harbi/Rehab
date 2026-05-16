import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/profile/data/models/profile_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
  Future<ProfileModel> updateProfileName(String newName);
  Future<ProfileModel> updateProfileImage(File imageFile);
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

  @override
  Future<ProfileModel> updateProfileName(String newName) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw const UnauthorizedFailure("Not logged in");

      final response = await _supabase
          .from('profiles')
          .update({'name': newName})
          .eq('id', user.id)
          .select()
          .single();

      return ProfileModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<ProfileModel> updateProfileImage(File imageFile) async {
    try {
      final user = _supabase.auth.currentUser;
      if (user == null) throw const UnauthorizedFailure("Not logged in");

      final fileName =
          '${user.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'avatars/$fileName';

      await _supabase.storage.from('avatars').upload(path, imageFile);

      final imageUrl = _supabase.storage.from('avatars').getPublicUrl(path);
      final response = await _supabase
          .from('profiles')
          .update({'image_url': imageUrl})
          .eq('id', user.id)
          .select()
          .single();

      return ProfileModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
