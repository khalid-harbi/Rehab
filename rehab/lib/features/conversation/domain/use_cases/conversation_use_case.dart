import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/conversation/domain/repositories/conversation_repository_domain.dart';

@lazySingleton
class ConversationUseCase {
  final ConversationRepositoryDomain _repositoryData;

  ConversationUseCase(this._repositoryData);

  Stream<List<types.Message>> getMessages(types.Room room) {
    return _repositoryData.getMessages(room);
  }

  // ===================================================================
  // ===================================================================

  Future<Result<void, Failure>> sendMessage(String text, String roomId) async {
    return await _repositoryData.sendMessage(text, roomId);
  }

  // ===================================================================
  // ===================================================================

  Future<Result<types.Room, Failure>> createRoom(String otherUserId) async {
    return await _repositoryData.createRoom(otherUserId);
  }
}
