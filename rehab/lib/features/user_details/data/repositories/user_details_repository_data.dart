
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/user_details/domain/entities/user_details_entity.dart';

import 'package:rehab/features/user_details/data/datasources/user_details_remote_data_source.dart';
import 'package:rehab/features/user_details/data/models/user_details_model.dart';
import 'package:rehab/features/user_details/domain/repositories/user_details_repository_domain.dart';

@LazySingleton(as: UserDetailsRepositoryDomain)
class UserDetailsRepositoryData implements UserDetailsRepositoryDomain{
  final BaseUserDetailsRemoteDataSource remoteDataSource;


  UserDetailsRepositoryData(this.remoteDataSource);

@override
  Future<Result<UserDetailsEntity, Failure>> getUserDetails() async {
    try {
      final response = await remoteDataSource.getUserDetails();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
