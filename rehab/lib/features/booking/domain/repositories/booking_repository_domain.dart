import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/booking/domain/entities/booking_entity.dart';

abstract class BookingRepositoryDomain {
  Future<Result<BookingEntity, Failure>> getBooking();
  Future<Result<BookingEntity, Failure>> createBooking({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  });
}
