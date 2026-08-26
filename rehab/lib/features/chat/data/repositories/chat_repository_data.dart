import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:rehab/features/chat/data/models/room_preview_model/room_preview_model.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';
import 'package:rehab/features/chat/domain/repositories/chat_repository_domain.dart';

@LazySingleton(as: ChatRepositoryDomain)
class ChatRepositoryData implements ChatRepositoryDomain {
  final BaseChatRemoteDataSource remoteDataSource;

  ChatRepositoryData(this.remoteDataSource);

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<List<RoomPreviewEntity>, Failure>> getRoomPreviews() async {
    try {
      final roomPreviews = await remoteDataSource.getRoomPreviews();
      return Success(roomPreviews.map((room) => room.toEntity()).toList());
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<Result<void, Failure>> hideRoomForCurrentUser(String roomId) async {
    try {
      await remoteDataSource.hideRoomForCurrentUser(roomId);
      return Success(null);
    } catch (e) {
      return Error(FailureExceptions.getException(e));
    }
  }
}
