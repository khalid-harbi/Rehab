import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<HomeModel>> getHome();
}

@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  HomeRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<HomeModel>> getHome() async {
    final response = await _supabase.from("home").select();
    return response.map<HomeModel>((json) => HomeModel.fromJson(json)).toList();
  }
}
