import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';

abstract class ConversationRepositoryDomain {
  Stream<List<types.Message>> getMessages(types.Room room);
  Future<Result<void, Failure>> sendMessage(String text, String roomId);
  Future<Result<types.Room, Failure>> createRoom(String otherUserId);
}
