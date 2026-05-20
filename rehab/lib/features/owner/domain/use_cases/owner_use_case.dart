import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';
import 'package:rehab/features/owner/domain/repositories/owner_repository_domain.dart';

@lazySingleton
class OwnerUseCase {
  final OwnerRepositoryDomain _repositoryData;

  OwnerUseCase(this._repositoryData);

  Future<Result<OwnerEntity, Failure>> getOwner() async {
    return _repositoryData.getOwner();
  }

  Future<Result<List<HomeEntity>, Failure>> getOwnerProperties() async {
    return _repositoryData.getOwnerProperties();
  }

  Future<Result<void, Failure>> togglePropertyAvailability(
    int propertyId,
    bool isAvailable,
  ) async {
    return await _repositoryData.togglePropertyAvailability(
      propertyId,
      isAvailable,
    );
  }
}
