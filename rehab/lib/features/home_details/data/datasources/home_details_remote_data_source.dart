import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/home_details/data/models/home_details_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseHomeDetailsRemoteDataSource {
  Future<HomeDetailsModel> getHomeDetails();
}

@LazySingleton(as: BaseHomeDetailsRemoteDataSource)
class HomeDetailsRemoteDataSource implements BaseHomeDetailsRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  HomeDetailsRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<HomeDetailsModel> getHomeDetails() async {
    try {
      final response = await _supabase.from('home').select().single();

      return HomeDetailsModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
