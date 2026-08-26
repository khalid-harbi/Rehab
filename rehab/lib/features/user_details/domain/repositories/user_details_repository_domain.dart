import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/user_details/domain/entities/user_details_entity.dart';

abstract class UserDetailsRepositoryDomain {
  Future<Result<UserDetailsEntity, Failure>> getUserDetails();
}
