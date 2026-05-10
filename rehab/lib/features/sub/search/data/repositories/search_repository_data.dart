
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/sub/search/data/datasources/search_remote_data_source.dart';
import 'package:rehab/features/sub/search/domain/repositories/search_repository_domain.dart';
import 'package:rehab/features/users/data/models/users_model.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

@LazySingleton(as: SearchRepositoryDomain)
class SearchRepositoryData implements SearchRepositoryDomain{
  final BaseSearchRemoteDataSource remoteDataSource;


  SearchRepositoryData(this.remoteDataSource);

 @override
  Future<Result<List<UsersEntity>, Failure>> search({
    required String name,
  }) async {
    try {
      final response = await remoteDataSource.search(name: name);
      return Success(
        response.map((items) => items.toEntity()).toList(),
      );
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
