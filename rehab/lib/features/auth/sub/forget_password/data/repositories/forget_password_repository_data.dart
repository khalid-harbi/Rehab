import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/forget_password/data/datasources/forget_password_remote_data_source.dart'
    show BaseForgetPasswordRemoteDataSource;
import 'package:rehab/features/auth/sub/forget_password/domain/repositories/forget_password_repository_domain.dart';

@LazySingleton(as: ForgetPasswordRepositoryDomain)
class ForgetPasswordRepositoryData implements ForgetPasswordRepositoryDomain {
  final BaseForgetPasswordRemoteDataSource remoteDataSource;

  ForgetPasswordRepositoryData(this.remoteDataSource);

  @override
  Future<Result<void, Failure>> sendResetPasswordEmail(String email) async {
    try {
      final response = await remoteDataSource.sendResetPasswordEmail(email);
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
