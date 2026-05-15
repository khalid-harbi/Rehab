import 'package:rehab/core/exports/app_exports.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<HomeEntity> homes;

  const SearchSuccessState({required this.homes});
  @override
  List<Object?> get props => [homes];
}

class SearchErrorState extends SearchState {
  final String message;
  const SearchErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
