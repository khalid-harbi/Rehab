import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/forget_password/domain/repositories/forget_password_repository_domain.dart';

@lazySingleton
class ForgetPasswordUseCase {
  final ForgetPasswordRepositoryDomain _repository;

  ForgetPasswordUseCase(this._repository);

  Future<Result<void, Failure>> call(String email) async {
    return _repository.sendResetPasswordEmail(email);
  }
}