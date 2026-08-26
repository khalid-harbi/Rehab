import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/booking/data/models/booking_model.dart';
import 'package:rehab/features/booking/domain/entities/booking_entity.dart';
import 'package:rehab/features/booking/data/datasources/booking_remote_data_source.dart';
import 'package:rehab/features/booking/domain/repositories/booking_repository_domain.dart';

@LazySingleton(as: BookingRepositoryDomain)
class BookingRepositoryData implements BookingRepositoryDomain {
  final BaseBookingRemoteDataSource remoteDataSource;

  BookingRepositoryData(this.remoteDataSource);

  @override
  Future<Result<BookingEntity, Failure>> getBooking() async {
    try {
      final response = await remoteDataSource.getBooking();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<BookingEntity, Failure>> createBooking({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  }) async {
    try {
      final response = await remoteDataSource.createBooking(
        homeId: homeId,
        amount: amount,
        durationMonths: durationMonths,
        paymentId: paymentId,
      );

      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
