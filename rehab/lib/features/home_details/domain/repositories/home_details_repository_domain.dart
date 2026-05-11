import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home_details/domain/entities/home_details_entity.dart';

abstract class HomeDetailsRepositoryDomain {
    Future<Result<HomeDetailsEntity, Failure>> getHomeDetails();
}
