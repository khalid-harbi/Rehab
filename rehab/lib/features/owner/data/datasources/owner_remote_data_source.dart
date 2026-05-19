import 'package:injectable/injectable.dart';
import 'package:rehab/core/services/local_keys_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/owner/data/models/owner_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseOwnerRemoteDataSource {
  Future<OwnerModel> getOwner();
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

      final response = await _supabase
          .from('bookings')
          .select('amount')
          .eq('owner_id', userId)
          .eq('status', 'paid');

      double totalRevenue = 0;
      for (final item in response) {
        final amount = item['amount'] as num? ?? 0;
        totalRevenue += amount.toDouble();
      }

      return OwnerModel(totalRevenue: totalRevenue);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
