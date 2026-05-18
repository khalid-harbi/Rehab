import 'package:equatable/equatable.dart';
import 'package:rehab/features/owner/domain/entities/owner_entity.dart';

abstract class OwnerState extends Equatable {
  const OwnerState();

  @override
  List<Object?> get props => [];
}

class OwnerInitialState extends OwnerState {
  const OwnerInitialState();
}

class OwnerSuccessState extends OwnerState {
  final OwnerEntity owner;

  const OwnerSuccessState({required this.owner});

  @override
  List<Object?> get props => [owner];
}

class OwnerErrorState extends OwnerState {
  final String message;

  const OwnerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}