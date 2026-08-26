import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart' show Failure;
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/logout/data/datasources/logout_remote_data_source.dart';
import 'package:rehab/features/auth/sub/logout/domain/repositories/logout_repository_domain.dart';

@LazySingleton(as: LogoutRepositoryDomain)
class LogoutRepositoryData implements LogoutRepositoryDomain {
  final BaseLogoutRemoteDataSource remoteDataSource;

  LogoutRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> getLogout() async {
    try {
      final response = await remoteDataSource.getLogout();
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
