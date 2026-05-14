import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/home/data/models/home_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HomeModel>> getHome();
  Future<List<HomeModel>> filter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  });
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final SupabaseClient _supabase;

  HomeRemoteDataSource(this._supabase);

  @override
  Future<List<HomeModel>> getHome() async {
    final response = await _supabase.from("home").select();
    return response.map<HomeModel>((json) => HomeModel.fromJson(json)).toList();
  }

  @override
  Future<List<HomeModel>> filter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  }) async {
    var query = _supabase.from("filter").select();

    if (city != null && city.isNotEmpty) {
      query = query.eq('city', city);
    }
    if (minPrice != null) {
      query = query.gte('price', minPrice);
    }
    if (maxPrice != null) {
      query = query.lte('price', maxPrice);
    }
    if (rooms != null && rooms > 0) {
      query = query.eq('rooms', rooms);
    }
    if (bathrooms != null && bathrooms > 0) {
      query = query.eq('bathrooms', bathrooms);
    }
    if (minRating != null) {
      query = query.gte('rating', minRating);
    }
    if (maxRating != null) {
      query = query.lte('rating', maxRating);
    }
    final response = await query.order('price', ascending: true);

    return response.map<HomeModel>((json) => HomeModel.fromJson(json)).toList();
  }
}
