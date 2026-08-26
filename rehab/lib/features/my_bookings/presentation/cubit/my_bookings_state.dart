import 'package:equatable/equatable.dart';
import 'package:rehab/features/my_bookings/domain/entities/my_bookings_entity.dart';

abstract class MyBookingsState extends Equatable {
  const MyBookingsState();

  @override
  List<Object?> get props => [];
}

class MyBookingsInitialState extends MyBookingsState {}

class MyBookingsLoadingState extends MyBookingsState {}

class MyBookingsSuccessState extends MyBookingsState {
  final List<MyBookingsEntity> bookings;

  const MyBookingsSuccessState({required this.bookings});

  @override
  List<Object?> get props => [bookings];
}

class MyBookingsErrorState extends MyBookingsState {
  final String message;

  const MyBookingsErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
