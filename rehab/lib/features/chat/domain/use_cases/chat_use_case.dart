import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';
import 'package:rehab/features/chat/domain/repositories/chat_repository_domain.dart';


@lazySingleton
class ChatUseCase {
  final ChatRepositoryDomain _repositoryData;

  ChatUseCase(this._repositoryData);

  // ===================================================================
  // ===================================================================

  Future<Result<List<RoomPreviewEntity>, Failure>> getRoomPreviews() async {
    return await _repositoryData.getRoomPreviews();
  }

  // ===================================================================
  // ===================================================================

  Future<Result<void, Failure>> hideRoomForCurrentUser(String roomId) async {
    return await _repositoryData.hideRoomForCurrentUser(roomId);
  }
}
