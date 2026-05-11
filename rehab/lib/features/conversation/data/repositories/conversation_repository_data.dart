import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/conversation/data/datasources/conversation_remote_data_source.dart';
import 'package:rehab/features/conversation/domain/repositories/conversation_repository_domain.dart';

@LazySingleton(as: ConversationRepositoryDomain)
class ConversationRepositoryData implements ConversationRepositoryDomain {
  final BaseConversationRemoteDataSource remoteDataSource;

  ConversationRepositoryData(this.remoteDataSource);

  // ===================================================================
  // ===================================================================

  @override
  Stream<List<types.Message>> getMessages(types.Room room) {
    return remoteDataSource.getMessages(room);
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<void, Failure>> sendMessage(String text, String roomId) async {
    try {
      await remoteDataSource.sendMessage(text, roomId);
      return const Success(null);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<types.Room, Failure>> createRoom(String otherUserId) async {
    try {
      final room = await remoteDataSource.createRoom(otherUserId);
      return Success(room);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  // ===================================================================
  // ===================================================================
}
