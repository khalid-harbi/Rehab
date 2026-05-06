import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

abstract class HomeRepositoryDomain {
    Future<Result<List<HomeEntity>, Failure>>  getHome();
}
