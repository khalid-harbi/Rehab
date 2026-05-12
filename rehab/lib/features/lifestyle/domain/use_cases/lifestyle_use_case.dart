import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';
import 'package:rehab/features/lifestyle/domain/repositories/lifestyle_repository_domain.dart';

@lazySingleton
class LifestyleUseCase {
  LifestyleUseCase(this._repositoryData);

  final LifestyleRepositoryDomain _repositoryData;

  // ==================================================================
  // ==================================================================

  Future<Result<LifestyleEntity, Failure>> loadScreenData() {
    return _repositoryData.loadScreenData();
  }

  // ==================================================================
  // ==================================================================

  Future<Result<void, Failure>> saveSelections(
    Map<String, String?> selectionsByOptionId,
  ) {
    return _repositoryData.saveSelections(selectionsByOptionId);
  }
}
