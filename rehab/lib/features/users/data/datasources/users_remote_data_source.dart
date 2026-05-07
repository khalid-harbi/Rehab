import 'package:injectable/injectable.dart';
import 'package:rehab/features/users/data/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseUsersRemoteDataSource {
  Future<List<UsersModel>> loadUsers();
}

@LazySingleton(as: BaseUsersRemoteDataSource)
class UsersRemoteDataSource implements BaseUsersRemoteDataSource {
  final SupabaseClient _supabase;

  UsersRemoteDataSource(this._supabase);

  @override
  Future<List<UsersModel>> loadUsers() async {
    final response = await _supabase.from("profiles").select();
    final users = response.map((user) => UsersModel.fromJson(user)).toList();
    return users;
  }
}
