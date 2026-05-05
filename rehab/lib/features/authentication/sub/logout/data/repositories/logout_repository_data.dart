
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/logout/domain/entities/logout_entity.dart';

import 'package:rehab/features/authentication/sub/logout/data/datasources/logout_remote_data_source.dart';
import 'package:rehab/features/authentication/sub/logout/data/models/logout_model.dart';
import 'package:rehab/features/authentication/sub/logout/domain/repositories/logout_repository_domain.dart';

@LazySingleton(as: LogoutRepositoryDomain)
class LogoutRepositoryData implements LogoutRepositoryDomain{
  final BaseLogoutRemoteDataSource remoteDataSource;


  LogoutRepositoryData(this.remoteDataSource);

@override
  Future<Result<LogoutEntity, Failure>> getLogout() async {
    try {
      final response = await remoteDataSource.getLogout();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
