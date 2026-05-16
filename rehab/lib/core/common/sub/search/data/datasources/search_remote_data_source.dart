import 'package:rehab/core/exports/app_exports.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<HomeModel>> search({required String title});
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

@LazySingleton(as: BaseSearchRemoteDataSource)
class SearchRemoteDataSource implements BaseSearchRemoteDataSource {
  final SupabaseClient _supabase;

  SearchRemoteDataSource(this._supabase);

  @override
  Future<List<HomeModel>> search({required String title}) async {
    final items = await _supabase
        .from('home')
        .select()
        .or('title_ar.ilike.%$title%,title_en.ilike.%$title%');
    List<HomeModel> homes = List.from(
      items,
    ).map((e) => HomeModel.fromJson(e)).toList();
    return homes;
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
      query = query.or('city_ar.eq.$city,city_en.eq.$city');
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
