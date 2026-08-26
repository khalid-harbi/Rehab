import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/booking/domain/entities/booking_entity.dart';
import 'package:rehab/features/booking/domain/repositories/booking_repository_domain.dart';

@lazySingleton
class BookingUseCase {
  final BookingRepositoryDomain _repositoryData;

  BookingUseCase(this._repositoryData);

  Future<Result<BookingEntity, Failure>> getBooking() async {
    return _repositoryData.getBooking();
  }

  Future<Result<BookingEntity, Failure>> createBooking({
    required int homeId,
    required double amount,
    required int durationMonths,
    required String paymentId,
  }) async {
    return _repositoryData.createBooking(
      homeId: homeId,
      amount: amount,
      durationMonths: durationMonths,
      paymentId: paymentId,
    );
  }
}
