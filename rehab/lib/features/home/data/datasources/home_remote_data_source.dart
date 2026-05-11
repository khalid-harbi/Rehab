import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/home/data/models/home_model.dart';

abstract class BaseHomeRemoteDataSource {

  Future<List<HomeModel>> getHome();
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
}
