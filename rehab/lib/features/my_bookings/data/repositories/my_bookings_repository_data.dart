import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/my_bookings/data/datasources/my_bookings_remote_data_source.dart';
import 'package:rehab/features/my_bookings/data/models/my_bookings_model.dart';
import 'package:rehab/features/my_bookings/domain/entities/my_bookings_entity.dart';
import 'package:rehab/features/my_bookings/domain/repositories/my_bookings_repository_domain.dart';

@LazySingleton(as: MyBookingsRepositoryDomain)
class MyBookingsRepositoryData implements MyBookingsRepositoryDomain {
  final BaseMyBookingsRemoteDataSource remoteDataSource;

  MyBookingsRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<MyBookingsEntity>, Failure>> getMyBookings() async {
    try {
      final response = await remoteDataSource.getMyBookings();

      final bookings = response
          .map((bookingModel) => bookingModel.toEntity())
          .toList();

      return Success(bookings);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
