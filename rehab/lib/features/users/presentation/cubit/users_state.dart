import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:rehab/features/users/domain/entities/users_entity.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

// ===================================================================
// ===================================================================

class UsersInitialState extends UsersState {}

// ===================================================================
// ===================================================================

class UsersSuccessState extends UsersState {
  final List<UsersEntity> users;
  const UsersSuccessState({required this.users});
}

// ===================================================================
// ===================================================================

class UsersLoadingState extends UsersState {}

// ===================================================================
// ===================================================================

class UsersRoomCreatedState extends UsersState {
  final types.Room room;
  const UsersRoomCreatedState(this.room);
  @override
  List<Object?> get props => [room];
}

// ===================================================================
// ===================================================================

class UsersErrorState extends UsersState {
  final String message;
  const UsersErrorState({required this.message});
  @override
  List<Object?> get props => [message];
}
