import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/authentication/sub/login/data/datasources/login_remote_data_source.dart';
import 'package:rehab/features/authentication/sub/login/domain/repositories/login_repository_domain.dart';

@LazySingleton(as: LoginRepositoryDomain)
class LoginRepositoryData implements LoginRepositoryDomain {
  final BaseLoginRemoteDataSource remoteDataSource;

  LoginRepositoryData(this.remoteDataSource);

  @override
  Future<Result<UserRole, Failure>> getLogin({
    required String email,
    required String password,
  }) async {
    try {
    //  final role = await remoteDataSource.getLogin(email: email, password: password);
    //   // return Success(null);
    //   return Success();
     final role = await remoteDataSource.getLogin(
        email: email,
        password: password,
      );

      return Success(role);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
