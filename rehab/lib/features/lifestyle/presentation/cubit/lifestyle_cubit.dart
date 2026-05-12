import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';
import 'package:rehab/features/lifestyle/domain/use_cases/lifestyle_use_case.dart';
import 'package:rehab/features/lifestyle/presentation/cubit/lifestyle_state.dart';

class LifestyleCubit extends Cubit<LifestyleState> {
  LifestyleCubit(this._useCase) : super(LifestyleInitialState()) {
    load();
  }

  final LifestyleUseCase _useCase;

  // ==================================================================
  // ==================================================================

  Future<void> load() async {
    emit(LifestyleLoadingState());
    final result = await _useCase.loadScreenData();
    result.when(
      (data) => emit(LifestyleLoadedState(data: data)),
      (failure) => emit(LifestyleErrorState(message: failure.message)),
    );
  }

  // ==================================================================
  // ==================================================================

  void selectChoice(String optionId, String choiceId) {
    final s = state;
    if (s is! LifestyleLoadedState) return;
    final map = Map<String, String?>.from(s.data.selectionsByOptionId);
    if (map[optionId] == choiceId) {
      map[optionId] = null;
    } else {
      map[optionId] = choiceId;
    }
    emit(
      s.copyWith(
        clearSaveError: true,
        data: LifestyleEntity(
          options: s.data.options,
          choices: s.data.choices,
          selectionsByOptionId: map,
        ),
      ),
    );
  }

  // ==================================================================
  // ==================================================================

  Future<void> save() async {
    final s = state;
    if (s is! LifestyleLoadedState) return;
    emit(s.copyWith(isSaving: true, clearSaveError: true));
    final result = await _useCase.saveSelections(s.data.selectionsByOptionId);
    result.when(
      (_) => emit(s.copyWith(isSaving: false, clearSaveError: true)),
      (failure) =>
          emit(s.copyWith(isSaving: false, saveError: failure.message)),
    );
  }

  // ==================================================================
  // ==================================================================
}
