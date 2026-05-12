import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';

abstract class LifestyleRepositoryDomain {
  Future<Result<LifestyleEntity, Failure>> loadScreenData();
  Future<Result<void, Failure>> saveSelections(
    Map<String, String?> selectionsByOptionId,
  );
}
