import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/sign_up/domain/entities/sign_up_entity.dart';

abstract class SignUpRepositoryDomain {
    Future<Result<SignUpEntity, Failure>> getSignUp();
}
