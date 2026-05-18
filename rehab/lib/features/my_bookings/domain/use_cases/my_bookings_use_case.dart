import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/my_bookings/domain/entities/my_bookings_entity.dart';
import 'package:rehab/features/my_bookings/domain/repositories/my_bookings_repository_domain.dart';

@lazySingleton
class MyBookingsUseCase {
  final MyBookingsRepositoryDomain _repositoryData;

  MyBookingsUseCase(this._repositoryData);

  Future<Result<List<MyBookingsEntity>, Failure>> getMyBookings() async {
    return _repositoryData.getMyBookings();
  }
}