import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';

import 'package:rehab/features/owner/data/datasources/owner_remote_data_source.dart';
import 'package:rehab/features/owner/data/models/owner_model.dart';
import 'package:rehab/features/owner/domain/repositories/owner_repository_domain.dart';

@LazySingleton(as: OwnerRepositoryDomain)
class OwnerRepositoryData implements OwnerRepositoryDomain {
  final BaseOwnerRemoteDataSource remoteDataSource;

  OwnerRepositoryData(this.remoteDataSource);

  @override
  Future<Result<OwnerEntity, Failure>> getOwner() async {
    try {
      final response = await remoteDataSource.getOwner();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<List<HomeEntity>, Failure>> getOwnerProperties() async {
    try {
      final response = await remoteDataSource.getOwnerProperties();

      final List<HomeEntity> propertiesEntities = response.map((json) {
        return HomeModel.fromJson(json).toEntity();
      }).toList();

      return Success(propertiesEntities);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
