import 'package:equatable/equatable.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object?> get props => [];
}

class BookingInitialState extends BookingState {}

class BookingLoadingState extends BookingState {}

class BookingSuccessState extends BookingState {}

class BookingErrorState extends BookingState {
  final String message;

  const BookingErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}