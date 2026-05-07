import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/domain/repositories/users_repository_domain.dart';

@lazySingleton
class UsersUseCase {
  final UsersRepositoryDomain _repositoryData;

  UsersUseCase(this._repositoryData);

  Future<Result<List<UsersEntity>, Failure>> loadUsers() async {
    return await _repositoryData.loadUsers();
  }
}
