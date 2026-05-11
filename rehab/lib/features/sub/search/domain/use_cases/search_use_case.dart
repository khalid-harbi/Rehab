import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/sub/search/domain/repositories/search_repository_domain.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

@lazySingleton
class SearchUseCase {
  final SearchRepositoryDomain _repositoryData;

  SearchUseCase(this._repositoryData);

  Future<Result<List<HomeEntity>, Failure>> search({
    required String title,
  }) async {
    return await _repositoryData.search(title: title);
  }
}
