import 'package:equatable/equatable.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_choice_entity.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_option_entity.dart';

class LifestyleEntity extends Equatable {
  final List<LifestyleOptionEntity> options;
  final List<LifestyleChoiceEntity> choices;
  final Map<String, String?> selectionsByOptionId;

  const LifestyleEntity({
    required this.options,
    required this.choices,
    required this.selectionsByOptionId,
  });

  // ==================================================================
  // ==================================================================
  List<LifestyleChoiceEntity> choicesForOption(String optionId) {
    return choices.where((c) => c.optionId == optionId).toList();
  }
  // ==================================================================
  // ==================================================================

  @override
  List<Object?> get props => [options, choices, selectionsByOptionId];
}
