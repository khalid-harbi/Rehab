import 'package:equatable/equatable.dart';

abstract class LogInWithOtpState extends Equatable {
  const LogInWithOtpState();

  @override
  List<Object?> get props => [];
}

class LogInWithOtpInitialState extends LogInWithOtpState {}

class LogInWithOtpLoadingState extends LogInWithOtpState {}

class LogInWithOtpSuccessState extends LogInWithOtpState {}

class LogInWithOtpErrorState extends LogInWithOtpState {
  final String message;
  const LogInWithOtpErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}


