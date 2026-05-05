import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:rehab/features/authentication/data/models/authentication_model.dart';
import 'package:rehab/features/authentication/domain/entities/authentication_entity.dart';
import 'package:rehab/features/authentication/domain/repositories/authentication_repository_domain.dart';


@LazySingleton(as: AuthRepositoryDomain)
class AuthRepositoryData implements AuthRepositoryDomain {
  final BaseAuthRemoteDataSource remoteDataSource;

  AuthRepositoryData(this.remoteDataSource);

  @override
  Future<Result<AuthEntity, Failure>> checkStatus() async {
    try {
      final response = await remoteDataSource.checkStatus();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
