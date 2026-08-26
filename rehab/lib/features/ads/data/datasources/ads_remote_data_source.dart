import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/ads/data/models/ad_model.dart';

abstract class BaseAdsRemoteDataSource {
  Future<List<AdModel>> getAds();
}

@LazySingleton(as: BaseAdsRemoteDataSource)
class AdsRemoteDataSource implements BaseAdsRemoteDataSource {
  final SupabaseClient _supabase;

  AdsRemoteDataSource(this._supabase);

  @override
  Future<List<AdModel>> getAds() async {
    try {
      final now = DateTime.now().toUtc().toIso8601String();

      final response = await _supabase
          .from("ads")
          .select()
          .eq('is_active', true)
          .or('starts_at.is.null,starts_at.lte.$now')
          .or('ends_at.is.null,ends_at.gte.$now')
          .order('sort_order', ascending: true);

      return response.map<AdModel>((json) => AdModel.fromJson(json)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
