import 'package:equatable/equatable.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';

abstract class OwnerState extends Equatable {
  const OwnerState();

  @override
  List<Object?> get props => [];
}

class OwnerInitialState extends OwnerState {
  const OwnerInitialState();
}

class OwnerLoadingState extends OwnerState {}

class OwnerSuccessState extends OwnerState {
  final OwnerEntity owner;
  final HomeEntity homes;

  const OwnerSuccessState({required this.owner, required this.homes});

  @override
  List<Object?> get props => [owner, homes];
}

class OwnerErrorState extends OwnerState {
  final String message;

  const OwnerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
