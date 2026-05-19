import 'package:equatable/equatable.dart';

abstract class HomeDetailsState extends Equatable {
  const HomeDetailsState();

  @override
  List<Object?> get props => [];
}

// =======================================================
// =======================================================

class HomeDetailsInitialState extends HomeDetailsState {
  const HomeDetailsInitialState();
}

// =======================================================
// =======================================================

class HomeDetailsSuccessState extends HomeDetailsState {}

// =======================================================
// =======================================================

class HomeDetailsErrorState extends HomeDetailsState {
  final String message;
  const HomeDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

// =======================================================
// =======================================================
