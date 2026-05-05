import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/forget_password/domain/entities/forget_password_entity.dart';

abstract class ForgetPasswordRepositoryDomain {
    Future<Result<ForgetPasswordEntity, Failure>> getForgetPassword();
}
