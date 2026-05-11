import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/features/users/data/datasources/users_remote_data_source.dart';
import 'package:rehab/features/users/data/models/users_model.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/domain/repositories/users_repository_domain.dart';

@LazySingleton(as: UsersRepositoryDomain)
class UsersRepositoryData implements UsersRepositoryDomain {
  final BaseUsersRemoteDataSource remoteDataSource;

  UsersRepositoryData(this.remoteDataSource);

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<List<UsersEntity>, Failure>> loadUsers() async {
    try {
      final response = await remoteDataSource.loadUsers();
      return Success(response.map((user) => user.toEntity()).toList());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<types.Room, Failure>> createChatRoom(String otherUserId) async {
    try {
      final response = await remoteDataSource.createChatRoom(otherUserId);
      // -------------------
      return Success(response);
      // -------------------
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
