import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';

abstract class LogoutRepositoryDomain {
  Future<Result<void, Failure>> getLogout();
}
