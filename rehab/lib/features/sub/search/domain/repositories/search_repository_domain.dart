import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

abstract class SearchRepositoryDomain {
  Future<Result<List<UsersEntity>, Failure>> search({required String name});
}
