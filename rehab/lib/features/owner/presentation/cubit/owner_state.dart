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
  final OwnerEntity? owner;
  final List<HomeEntity> homes;

  const OwnerSuccessState({this.owner, this.homes = const []});

  // Add this copyWith method to allow the Cubit to update fields without wiping existing data
  OwnerSuccessState copyWith({OwnerEntity? owner, List<HomeEntity>? homes}) {
    return OwnerSuccessState(
      owner: owner ?? this.owner,
      homes: homes ?? this.homes,
    );
  }

  @override
  List<Object?> get props => [owner, homes];
}

class OwnerErrorState extends OwnerState {
  final String message;

  const OwnerErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
