import 'package:equatable/equatable.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchState {}

class SearchInitialState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<UsersEntity> items;

  const SearchSuccessState({required this.items});
  @override
  List<Object?> get props => [items];
}

class SearchErrorState extends SearchState {
  final String message;
  const SearchErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
