import 'package:equatable/equatable.dart';

abstract class UserDetailsState extends Equatable {
  const UserDetailsState();

  @override
  List<Object?> get props => [];
}

class UserDetailsInitialState extends UserDetailsState {}
class UserDetailsSuccessState extends UserDetailsState {}

class UserDetailsErrorState extends UserDetailsState {
  final String message;
  const UserDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

