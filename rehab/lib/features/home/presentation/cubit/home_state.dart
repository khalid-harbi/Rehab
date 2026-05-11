import 'package:equatable/equatable.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final List<HomeEntity> homes;

  const HomeSuccessState(this.homes);
}

class HomeErrorState extends HomeState {
  final String message;

  const HomeErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
