import 'dart:convert';

import 'package:rehab/core/exports/app_exports.dart';

abstract class BaseFavoritesRemoteDataSource {
  Future<List<FavoritesModel>> getFavorites();
  Future<List<HomeModel>> getFavoriteHomes();

  Future<void> toggleFavorite({required int homeId});

  Future<bool> isFavorite({required int homeId});
}

@LazySingleton(as: BaseFavoritesRemoteDataSource)
class FavoritesRemoteDataSource implements BaseFavoritesRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  FavoritesRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<HomeModel>> getFavoriteHomes() async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        return [];
      }
      final response = await _supabase
          .from("favorites")
          .select("home(*)")
          .eq("user_id", userId);
      return response
          .map<HomeModel>((json) => HomeModel.fromJson(json['home']))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
      @override
      Future<List<FavoritesModel>> getFavorites() async {
        try {
          final userId = _supabase.auth.currentUser?.id;

          if (userId == null) {
            return [];
          }

          final response = await _supabase
              .from('favorites')
              .select()
              .eq('user_id', userId);

          return response
              .map<FavoritesModel>((json) => FavoritesModel.fromJson(json))
              .toList();
        } catch (error) {
          throw FailureExceptions.getException(error);
        }
      }

      @override
      Future<bool> isFavorite({required int homeId}) async {
        try {
          final userId = _supabase.auth.currentUser?.id;

          if (userId == null) {
            return false;
          }

          final response = await _supabase
              .from('favorites')
              .select('id')
              .eq('user_id', userId)
              .eq('home_id', homeId)
              .maybeSingle();

          return response != null;
        } catch (error) {
          throw FailureExceptions.getException(error);
        }
      }

      @override
      Future<void> toggleFavorite({required int homeId}) async {
        try {
          final userId = _supabase.auth.currentUser?.id;

          if (userId == null) {
            return;
          }

          final exists = await isFavorite(homeId: homeId);

          if (exists) {
            await _supabase
                .from('favorites')
                .delete()
                .eq('user_id', userId)
                .eq('home_id', homeId);
          } else {
            await _supabase.from('favorites').insert({
              'user_id': userId,
              'home_id': homeId,
            });
          }
        } catch (error) {
          throw FailureExceptions.getException(error);
        }
      }
    }
 