import 'package:rehab/core/exports/app_exports.dart';

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

class FavoritesHomesSuccessState extends FavoritesState {
  final List<HomeEntity> homes;

  const FavoritesHomesSuccessState({
    required this.homes,
  });

  @override
  List<Object?> get props => [homes];
}

class FavoritesErrorState extends FavoritesState {
  final String message;
  const FavoritesErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}

