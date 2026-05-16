import 'package:equatable/equatable.dart';
import 'package:rehab/features/home_details/domain/entities/home_details_entity.dart';

abstract class HomeDetailsState extends Equatable {
  const HomeDetailsState();

  @override
  List<Object?> get props => [];
}

class HomeDetailsInitialState extends HomeDetailsState {
   const HomeDetailsInitialState();
}
class HomeDetailsSuccessState extends HomeDetailsState {
  final HomeDetailsEntity homeDetails;
   const HomeDetailsSuccessState({required this.homeDetails});
  @override
  List<Object?> get props => [homeDetails];
}

class HomeDetailsErrorState extends HomeDetailsState {
  final String message;
  const HomeDetailsErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

