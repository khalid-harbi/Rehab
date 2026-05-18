import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:rehab/features/booking/data/models/booking_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseBookingRemoteDataSource {
  Future<BookingModel> getBooking();
  Future<BookingModel> createBooking({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  });
}

@LazySingleton(as: BaseBookingRemoteDataSource)
class BookingRemoteDataSource implements BaseBookingRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  BookingRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<BookingModel> getBooking() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      final response = await _supabase
          .from('bookings')
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false)
          .limit(1)
          .single();

      return BookingModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<BookingModel> createBooking({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      final homeResponse = await _supabase
          .from('home')
          .select('owner_id')
          .eq('id', homeId)
          .single();

      final ownerId = homeResponse['owner_id'];

      if (ownerId == null) {
        throw Exception('This home does not have an owner_id');
      }

      final response = await _supabase
          .from('bookings')
          .insert({
            'seeker_id': userId,
            'owner_id': ownerId,
            'home_id': homeId,
            'amount': amount,
            'duration_months': durationMonths,
            'payment_id': paymentId,
            'status': 'paid',
          })
          .select()
          .single();

      return BookingModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
