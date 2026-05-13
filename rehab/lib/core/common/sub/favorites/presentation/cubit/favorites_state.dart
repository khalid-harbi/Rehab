import 'package:equatable/equatable.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object?> get props => [];
}

class FavoritesInitialState extends FavoritesState {}
class FavoritesSuccessState extends FavoritesState {
  final bool isFavorite;
  final int homeId;
  const FavoritesSuccessState({required this.isFavorite, required this.homeId});
    @override
  List<Object?> get props => [
        isFavorite,
        homeId,
      ];
}

class FavoritesErrorState extends FavoritesState {
  final String message;
  const FavoritesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

