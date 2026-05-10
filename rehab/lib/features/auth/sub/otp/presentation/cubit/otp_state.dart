import 'package:equatable/equatable.dart';

abstract class OtpState extends Equatable {
  const OtpState();

  @override
  List<Object?> get props => [];
}

class OtpLoadingState extends OtpState {}

class OtpInitialState extends OtpState {}

class OtpSuccessState extends OtpState {}

class OtpErrorState extends OtpState {
  final String message;
  const OtpErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
