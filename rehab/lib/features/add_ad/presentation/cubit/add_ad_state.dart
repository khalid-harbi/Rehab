import 'package:equatable/equatable.dart';

abstract class AddAdState extends Equatable {
  const AddAdState();

  @override
  List<Object?> get props => [];
}

class AddAdInitialState extends AddAdState {}

class AddAdSuccessState extends AddAdState {}

class AddAdLoadingState extends AddAdState {}

class AddAdErrorState extends AddAdState {
  final String message;
  const AddAdErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
