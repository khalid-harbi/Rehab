import 'package:equatable/equatable.dart';

abstract class GoogleLogInState extends Equatable {
  const GoogleLogInState();

  @override
  List<Object?> get props => [];
}

class GoogleLogInInitialState extends GoogleLogInState {}

class GoogleLogLoadingState extends GoogleLogInState {}

class GoogleLogInSuccessState extends GoogleLogInState {}

class GoogleLogInErrorState extends GoogleLogInState {
  final String message;
  const GoogleLogInErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
