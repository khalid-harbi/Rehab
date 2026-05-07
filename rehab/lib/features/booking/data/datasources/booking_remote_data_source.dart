import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/booking/data/models/booking_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';


abstract class BaseBookingRemoteDataSource {
  Future<BookingModel> getBooking();
}


@LazySingleton(as: BaseBookingRemoteDataSource)
class BookingRemoteDataSource implements BaseBookingRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   BookingRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<BookingModel> getBooking() async {
    try {
      return BookingModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
