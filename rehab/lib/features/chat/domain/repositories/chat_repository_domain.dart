import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';

abstract class ChatRepositoryDomain {
  Future<Result<List<RoomPreviewEntity>, Failure>> getRoomPreviews();
  Future<Result<void, Failure>> hideRoomForCurrentUser(String roomId);
}
