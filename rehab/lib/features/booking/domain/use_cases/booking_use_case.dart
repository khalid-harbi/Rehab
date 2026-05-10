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
}
