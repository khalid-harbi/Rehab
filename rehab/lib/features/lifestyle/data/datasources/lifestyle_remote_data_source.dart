import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/lifestyle/data/models/lifestyle_choice_model/lifestyle_choice_model.dart';
import 'package:rehab/features/lifestyle/data/models/lifestyle_option_model/lifestyle_option_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseLifestyleRemoteDataSource {
  Future<List<LifestyleOptionModel>> fetchOptions();
  Future<List<LifestyleChoiceModel>> fetchChoices();
  Future<Map<String, String>> fetchUserAnswersByOptionId(String userId);
  Future<void> syncUserAnswers({
    required String userId,
    required List<String> optionIds,
    required Map<String, String?> selectionsByOptionId,
  });
}
// ==================================================================
// ==================================================================

@LazySingleton(as: BaseLifestyleRemoteDataSource)
class LifestyleRemoteDataSource implements BaseLifestyleRemoteDataSource {
  LifestyleRemoteDataSource(this._supabase);

  final SupabaseClient _supabase;

  // ==================================================================
  // ==================================================================

  @override
  Future<List<LifestyleOptionModel>> fetchOptions() async {
    try {
      final response = await _supabase
          .from('lifestyle_options')
          .select()
          .order('title_en', ascending: true);
      return List<Map<String, dynamic>>.from(
        response,
      ).map(LifestyleOptionModel.fromJson).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ==================================================================
  // ==================================================================

  @override
  Future<List<LifestyleChoiceModel>> fetchChoices() async {
    try {
      final response = await _supabase
          .from('lifestyle_choices')
          .select()
          .order('value_en', ascending: true);
      return List<Map<String, dynamic>>.from(
        response,
      ).map(LifestyleChoiceModel.fromJson).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ==================================================================
  // ==================================================================

  @override
  Future<Map<String, String>> fetchUserAnswersByOptionId(String userId) async {
    try {
      final response = await _supabase
          .from('user_lifestyle_answers')
          .select('option_id, choice_id')
          .eq('user_id', userId);
      final map = <String, String>{};
      for (final row in List<Map<String, dynamic>>.from(response)) {
        final optionId = row['option_id']?.toString();
        final choiceId = row['choice_id']?.toString();
        if (optionId != null && choiceId != null) {
          map[optionId] = choiceId;
        }
      }
      return map;
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ==================================================================
  // ==================================================================

  @override
  Future<void> syncUserAnswers({
    required String userId,
    required List<String> optionIds,
    required Map<String, String?> selectionsByOptionId,
  }) async {
    try {
      for (final optionId in optionIds) {
        final choiceId = selectionsByOptionId[optionId];
        if (choiceId == null || choiceId.isEmpty) {
          await _supabase
              .from('user_lifestyle_answers')
              .delete()
              .eq('user_id', userId)
              .eq('option_id', optionId);
        } else {
          await _supabase.from('user_lifestyle_answers').upsert({
            'user_id': userId,
            'option_id': optionId,
            'choice_id': choiceId,
          }, onConflict: 'user_id,option_id');
        }
      }
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ==================================================================
  // ==================================================================
}
