import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/authentication/sub/logout/domain/entities/logout_entity.dart';

abstract class LogoutRepositoryDomain {
    Future<Result<LogoutEntity, Failure>> getLogout();
}
