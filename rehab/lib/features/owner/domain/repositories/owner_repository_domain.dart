import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';

abstract class OwnerRepositoryDomain {
  Future<Result<OwnerEntity, Failure>> getOwner();
  Future<Result<List<HomeEntity>, Failure>> getOwnerProperties();
}
