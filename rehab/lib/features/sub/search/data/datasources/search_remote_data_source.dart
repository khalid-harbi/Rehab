import 'package:injectable/injectable.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/features/users/data/models/users_model/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<HomeModel>> search({required String title});
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
        .like('title', '$title%');

    List<HomeModel> homes = List.from(
      items,
    ).map((e) => HomeModel.fromJson(e)).toList();
    return homes;
  }
}
