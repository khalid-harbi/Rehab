import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/login/domain/entities/login_entity.dart';

abstract class LoginRepositoryDomain {
    Future<Result<LoginEntity, Failure>> getLogin();
}
