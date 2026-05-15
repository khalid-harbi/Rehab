import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/entities/google_log_in_entity.dart';

import 'package:rehab/features/auth/sub/google_log_in/data/datasources/google_log_in_remote_data_source.dart';
import 'package:rehab/features/auth/sub/google_log_in/data/models/google_log_in_model.dart';
import 'package:rehab/features/auth/sub/google_log_in/domain/repositories/google_log_in_repository_domain.dart';

@LazySingleton(as: GoogleLogInRepositoryDomain)
class GoogleLogInRepositoryData implements GoogleLogInRepositoryDomain {
  final BaseGoogleLogInRemoteDataSource remoteDataSource;

  GoogleLogInRepositoryData(this.remoteDataSource);

  @override
  Future<Result<GoogleLogInEntity, Failure>> getGoogleLogIn() async {
    try {
      final response = await remoteDataSource.getGoogleLogIn();
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
