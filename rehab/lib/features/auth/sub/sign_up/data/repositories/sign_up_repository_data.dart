import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/auth/sub/sign_up/data/datasources/sign_up_remote_data_source.dart';
import 'package:rehab/features/auth/sub/sign_up/domain/repositories/sign_up_repository_domain.dart';

@LazySingleton(as: SignUpRepositoryDomain)
class SignUpRepositoryData implements SignUpRepositoryDomain {
  final BaseSignUpRemoteDataSource remoteDataSource;

  SignUpRepositoryData(this.remoteDataSource);

  @override
  Future<Result<bool, Failure>> getSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.getSignUp(
        name: name,
        email: email,
        password: password,
      );
      return Success(response);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
