import 'package:injectable/injectable.dart';
import 'package:rehab/features/users/data/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSearchRemoteDataSource {
  Future<List<UsersModel>> search({required String name});
}

@LazySingleton(as: BaseSearchRemoteDataSource)
class SearchRemoteDataSource implements BaseSearchRemoteDataSource {
  final SupabaseClient _supabase;

  SearchRemoteDataSource(this._supabase);

  @override
  Future<List<UsersModel>> search({required String name}) async {
    final items = await _supabase
        .from('profiles')
        .select()
        .like('name', '$name%');

    List<UsersModel> products = List.from(
      items,
    ).map((item) => UsersModel.fromJson(item)).toList();
    return products;
  }
}
