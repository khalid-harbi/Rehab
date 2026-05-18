import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/my_bookings/domain/entities/my_bookings_entity.dart';

abstract class MyBookingsRepositoryDomain {
    Future<Result<List<MyBookingsEntity>, Failure>> getMyBookings();
}
