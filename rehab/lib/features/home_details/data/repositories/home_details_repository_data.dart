
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home_details/domain/entities/home_details_entity.dart';

import 'package:rehab/features/home_details/data/datasources/home_details_remote_data_source.dart';
import 'package:rehab/features/home_details/data/models/home_details_model.dart';
import 'package:rehab/features/home_details/domain/repositories/home_details_repository_domain.dart';

@LazySingleton(as: HomeDetailsRepositoryDomain)
class HomeDetailsRepositoryData implements HomeDetailsRepositoryDomain{
  final BaseHomeDetailsRemoteDataSource remoteDataSource;


  HomeDetailsRepositoryData(this.remoteDataSource);

@override
  Future<Result<HomeDetailsEntity, Failure>> getHomeDetails() async {
    try {
      final response = await remoteDataSource.getHomeDetails();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
