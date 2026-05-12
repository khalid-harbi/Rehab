import 'package:equatable/equatable.dart';

abstract class OwnerState extends Equatable {
  const OwnerState();

  @override
  List<Object?> get props => [];
}

class OwnerInitialState extends OwnerState {}
class OwnerSuccessState extends OwnerState {}

class OwnerErrorState extends OwnerState {
  final String message;
  const OwnerErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

