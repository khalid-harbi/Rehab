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
    try {
      await Future.delayed(const Duration(seconds: 1));

      return [
        HomeModel(
          id: '1',
          title: 'غرفة مفردة فاخرة',
          city: 'الرياض',
          district: 'حي النرجس',
          imageUrl:
              'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267',
          price: 1800,
          rating: 4.8,
          rooms: 1,
          bathrooms: 1,
          description: 'غرفة مفردة واسعة ومشرقة في شقة آمنة ومريحة.',
          isAvailable: true,
        ),
        HomeModel(
          id: '2',
          title: 'غرفة مشتركة',
          city: 'الرياض',
          district: 'حي الياسمين',
          imageUrl:
              'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85',
          price: 900,
          rating: 4.2,
          rooms: 2,
          bathrooms: 1,
          description: 'غرفة مشتركة مناسبة للطالبات وقريبة من الخدمات.',
          isAvailable: true,
        ),
      ];
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
