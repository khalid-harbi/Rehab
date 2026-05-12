import 'package:equatable/equatable.dart';
import 'package:rehab/features/lifestyle/domain/entities/lifestyle_entity.dart';

abstract class LifestyleState extends Equatable {
  const LifestyleState();

  @override
  List<Object?> get props => [];
}

// ==================================================================
// ==================================================================

class LifestyleInitialState extends LifestyleState {}

// ==================================================================
// ==================================================================

class LifestyleLoadingState extends LifestyleState {}

// ==================================================================
// ==================================================================

class LifestyleLoadedState extends LifestyleState {
  final LifestyleEntity data;
  final bool isSaving;
  final String? saveError;

  const LifestyleLoadedState({
    required this.data,
    this.isSaving = false,
    this.saveError,
  });

  LifestyleLoadedState copyWith({
    LifestyleEntity? data,
    bool? isSaving,
    String? saveError,
    bool clearSaveError = false,
  }) {
    return LifestyleLoadedState(
      data: data ?? this.data,
      isSaving: isSaving ?? this.isSaving,
      saveError: clearSaveError ? null : (saveError ?? this.saveError),
    );
  }

  @override
  List<Object?> get props => [data, isSaving, saveError];
}

// ==================================================================
// ==================================================================

class LifestyleErrorState extends LifestyleState {
  final String message;
  const LifestyleErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}

// ==================================================================
// ==================================================================
