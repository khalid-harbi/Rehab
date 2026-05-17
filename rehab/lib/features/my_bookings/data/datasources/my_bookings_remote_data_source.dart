
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/my_bookings/data/models/my_bookings_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseMyBookingsRemoteDataSource {
Future<List<MyBookingsModel>> getMyBookings();}


@LazySingleton(as: BaseMyBookingsRemoteDataSource)
class MyBookingsRemoteDataSource implements BaseMyBookingsRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   MyBookingsRemoteDataSource(this._localKeysService, this._supabase);


@override
  Future<List<MyBookingsModel>> getMyBookings() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User not logged in');
      }

      final response = await _supabase
          .from('bookings')
          .select('''
            *,
            home(*)
          ''')
          .eq('seeker_id', userId)
          .order('created_at', ascending: false);

      return response
          .map<MyBookingsModel>(
            (booking) => MyBookingsModel.fromJson(booking),
          )
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
