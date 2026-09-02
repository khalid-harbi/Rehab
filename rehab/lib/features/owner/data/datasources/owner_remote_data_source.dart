import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/owner/data/models/owner_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseOwnerRemoteDataSource {
  Future<OwnerModel> getOwner();
  Future<List<Map<String, dynamic>>> getOwnerProperties();
  Future<void> togglePropertyAvailability(int propertyId, bool isAvailable);
  Future<void> deleteProperty(int propertyId);
}

@LazySingleton(as: BaseOwnerRemoteDataSource)
class OwnerRemoteDataSource implements BaseOwnerRemoteDataSource {
  final SupabaseClient _supabase;

  OwnerRemoteDataSource(this._supabase);

  @override
  Future<OwnerModel> getOwner() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      final bookingResponse = await _supabase
          .from('bookings')
          .select('amount')
          .eq('owner_id', userId)
          .eq('status', 'paid');

      final propertyCount = await _supabase
          .from('home')
          .count(CountOption.exact)
          .eq('owner_id', userId);

      double totalRevenue = 0;
      for (final item in bookingResponse) {
        final amount = item['amount'] as num? ?? 0;
        totalRevenue += amount.toDouble();
      }

      final int paidBookingsCount = bookingResponse.length;

      return OwnerModel(
        totalRevenue: totalRevenue,
        propertyCount: propertyCount,
        paidBookingsCount: paidBookingsCount,
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getOwnerProperties() async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      final List<Map<String, dynamic>> response = await _supabase
          .from('home')
          .select('*')
          .eq('owner_id', userId);

      return response;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> togglePropertyAvailability(
    int propertyId,
    bool isAvailable,
  ) async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      await _supabase
          .from('home')
          .update({'is_available': isAvailable})
          .eq('id', propertyId)
          .eq('owner_id', userId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> deleteProperty(int propertyId) async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not logged in');
      }

      // شرط المالك يمنع حذف عقار لا يملكه المستخدم الحالي.
      await _supabase
          .from('home')
          .delete()
          .eq('id', propertyId)
          .eq('owner_id', userId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
