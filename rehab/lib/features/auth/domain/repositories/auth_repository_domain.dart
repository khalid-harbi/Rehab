import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/auth/domain/entities/auth_entity.dart';


abstract class AuthRepositoryDomain {
  Future<Result<AuthEntity, Failure>> checkStatus();
}
