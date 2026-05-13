import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/data/models/home_model.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/core/common/sub/search/data/datasources/search_remote_data_source.dart';
import 'package:rehab/core/common/sub/search/domain/repositories/search_repository_domain.dart';

@LazySingleton(as: SearchRepositoryDomain)
class SearchRepositoryData implements SearchRepositoryDomain {
  final BaseSearchRemoteDataSource remoteDataSource;

  SearchRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<HomeEntity>, Failure>> search({
    required String title,
  }) async {
    try {
      final response = await remoteDataSource.search(title: title);
      return Success(response.map((e) => e.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
