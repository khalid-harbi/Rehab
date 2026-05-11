import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

abstract class SearchRepositoryDomain {
  Future<Result<List<HomeEntity>, Failure>> search({required String title});
}
