import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/errors/failure.dart';

abstract class LoginRepositoryDomain {
  Future<Result<UserRole, Failure>> getLogin({
    required String email,
    required String password,
  });
}
