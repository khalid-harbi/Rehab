import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class UsersRepositoryDomain {
  Future<Result<List<UsersEntity>, Failure>> loadUsers();
  Future<Result<types.Room, Failure>> createChatRoom(String otherUserId);
}
