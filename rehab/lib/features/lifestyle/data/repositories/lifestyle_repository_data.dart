import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/lifestyle/data/datasources/lifestyle_remote_data_source.dart';
import 'package:rehab/features/lifestyle/data/models/lifestyle_choice_model/lifestyle_choice_model.dart';
import 'package:rehab/features/lifestyle/data/models/lifestyle_option_model/lifestyle_option_model.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';
import 'package:rehab/features/lifestyle/domain/repositories/lifestyle_repository_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: LifestyleRepositoryDomain)
class LifestyleRepositoryData implements LifestyleRepositoryDomain {
  LifestyleRepositoryData(this._remote, this._supabase);

  final BaseLifestyleRemoteDataSource _remote;
  final SupabaseClient _supabase;

  String? get _userId => _supabase.auth.currentUser?.id;

  @override
  Future<Result<LifestyleEntity, Failure>> loadScreenData() async {
    try {
      final userId = _userId;
      if (userId == null) {
        return const Error(UnauthorizedFailure('Not signed in'));
      }
      final options = await _remote.fetchOptions();
      final choices = await _remote.fetchChoices();
      final existing = await _remote.fetchUserAnswersByOptionId(userId);

      final selections = <String, String?>{
        for (final o in options) o.id: existing[o.id],
      };

      return Success(
        LifestyleEntity(
          options: options.map((e) => e.toEntity()).toList(),
          choices: choices.map((e) => e.toEntity()).toList(),
          selectionsByOptionId: selections,
        ),
      );
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  @override
  Future<Result<void, Failure>> saveSelections(
    Map<String, String?> selectionsByOptionId,
  ) async {
    try {
      final userId = _userId;
      if (userId == null) {
        return const Error(UnauthorizedFailure('Not signed in'));
      }
      final optionIds = selectionsByOptionId.keys.toList();
      await _remote.syncUserAnswers(
        userId: userId,
        optionIds: optionIds,
        selectionsByOptionId: selectionsByOptionId,
      );
      return const Success(null);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }
}
