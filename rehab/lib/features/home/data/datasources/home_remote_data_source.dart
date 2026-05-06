import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseHomeRemoteDataSource {
  Future<HomeModel> getHome();
}


@LazySingleton(as: BaseHomeRemoteDataSource)
class HomeRemoteDataSource implements BaseHomeRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   HomeRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<HomeModel> getHome() async {
    try {
      return HomeModel(
        id: '1',
        title: 'Cozy Apartment in Downtown',
        city: 'New York',
        district: 'Manhattan',
        imageUrl: 'https://example.com/images/home1.jpg',
        price: 1500,
        rating: 4.5,
        rooms: 2,
        bathrooms: 1,
        description: 'A cozy apartment located in the heart of downtown, close to all amenities.',
        isAvailable: true,
      );
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
