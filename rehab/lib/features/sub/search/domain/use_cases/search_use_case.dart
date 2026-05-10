import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/sub/search/domain/repositories/search_repository_domain.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

@lazySingleton
class SearchUseCase {
  final SearchRepositoryDomain _repositoryData;

  SearchUseCase(this._repositoryData);

  Future<Result<List<UsersEntity>, Failure>> search({
    required String name,
  }) async {
    return await _repositoryData.search(name: name);
  }
}
