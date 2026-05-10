import 'package:equatable/equatable.dart';
import 'package:rehab/core/constants/app_enums.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  // final UserRole role;
  // const LoginSuccessState({required this.role});
  const LoginSuccessState();
}

class LoginErrorState extends LoginState {
  final String message;
  const LoginErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
