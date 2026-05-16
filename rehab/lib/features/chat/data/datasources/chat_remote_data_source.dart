import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:rehab/core/utils/supabase_users_map.dart';
import 'package:rehab/features/chat/data/models/room_preview_model/room_preview_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseChatRemoteDataSource {
  Future<List<RoomPreviewModel>> getRoomPreviews();
  Future<void> hideRoomForCurrentUser(String roomId);
}

@LazySingleton(as: BaseChatRemoteDataSource)
class ChatRemoteDataSource implements BaseChatRemoteDataSource {
  final SupabaseClient _supabase;

  ChatRemoteDataSource(this._supabase);

  types.Room getRoom(
    Map<String, dynamic> roomMap,
    Map<String, String> usersMap,
  ) {
    // List<String>.from to create a copy List out of an existing List
    // Extract users Ids from room object
    final userIds = List<String>.from((roomMap['userIds'] as List?) ?? []);

    // ------------------------------

    // Users are required to get the room using the package
    final users = userIds
        .map(
          (id) => types.User(
            id: id,
            firstName: usersMap[id],
            metadata: {'name': usersMap[id]},
          ),
        )
        .toList();

    // ------------------------------

    // get the room using the package
    return types.Room(
      id: roomMap['id'] as String,
      type: types.RoomType.direct,
      users: users,
      metadata: Map<String, dynamic>.from((roomMap['metadata'] as Map?) ?? {}),
    );
  }

  // ===================================================================
  // ===================================================================

  // TODO: review later
  String displayName(
    types.Room room,
    String currentUserId,
    Map<String, String> usersNameById,
  ) {
    types.User? otherUser;
    for (final user in room.users) {
      if (user.id != currentUserId) {
        otherUser = user;
        break;
      }
    }

    final fromUsersList = [otherUser?.firstName, otherUser?.lastName]
        .whereType<String>()
        .map((part) => part.trim())
        .where((part) => part.isNotEmpty)
        .join(' ')
        .trim();
    if (fromUsersList.isNotEmpty) return fromUsersList;

    final metadataName = (otherUser?.metadata?['name'] as String?)?.trim();
    if (metadataName != null && metadataName.isNotEmpty) return metadataName;

    final fromUsersTable = usersNameById[otherUser?.id ?? '']?.trim();
    if (fromUsersTable != null && fromUsersTable.isNotEmpty) {
      return fromUsersTable;
    }

    final roomName = room.name?.trim();
    if (roomName != null && roomName.isNotEmpty) return roomName;

    return "مستخدم";
  }

  // ===================================================================
  // ===================================================================

  // TODO: review later
  Future<Map<String, String>> loadLastMessagesByRoom(
    Set<String> roomIds,
  ) async {
    // ------------------------------
    if (roomIds.isEmpty) return {};
    // ------------------------------

    final response = await _supabase
        .from('messages')
        .select()
        // Only fetch messages that belongs to these rooms
        .inFilter('roomId', roomIds.toList())
        .order('createdAt', ascending: false);

    // ------------------------------

    final Map<String, String> result = {};

    for (final row in List<Map<String, dynamic>>.from(response)) {
      // ------------------------------
      final roomId = row['roomId']?.toString();
      // ------------------------------
      if (roomId == null || result.containsKey(roomId)) {
        // Skip the rest of this loop and move to the next message
        continue;
      }
      // ------------------------------

      final content = row['content']?.toString().trim();
      if (content != null && content.isNotEmpty) {
        result[roomId] = content;
      }
    }
    // ------------------------------

    return result;
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<List<RoomPreviewModel>> getRoomPreviews() async {
    final currentUserId = _supabase.auth.currentUser!.id;
    // Fetching Raw Rooms
    final roomsResponse = await _supabase.from('rooms').select();
    // ------------------------------

    // List<Map<String, dynamic>>.from to create a copy List out of an existing List
    final roomsMaps = List<Map<String, dynamic>>.from(roomsResponse);

    // ------------------------------
    final Set<String> allUserIds = {};

    for (final room in roomsMaps) {
      // Add unique values
      allUserIds.addAll(List<String>.from((room['userIds'] as List?) ?? []));
    }
    // get users names
    final usersMap = await loadUsersNameMap(_supabase, allUserIds);

    // ------------------------------

    final List<types.Room> rooms = roomsMaps
        // get every room created by the package
        .map((roomMap) => getRoom(roomMap, usersMap))
        // for every single room,
        // When true, room stays in the list. When false, skip
        .where((room) {
          // go through users to check if user.id is in the list
          final roomUserIds = room.users.map((user) => user.id).toSet();
          // Are you in this room?
          if (!roomUserIds.contains(currentUserId)) {
            return false;
          }
          // Did you hide this room?
          final hiddenFor = List<String>.from(
            room.metadata?['hiddenFor'] ?? [],
          );
          return !hiddenFor.contains(currentUserId);
        })
        .toList();

    // rooms.sort((a, b) => (b.updatedAt ?? 0).compareTo(a.updatedAt ?? 0));

    // ------------------------------

    // TODO: review later
    // Fetching the "Last Message" Previews
    final roomIds = rooms.map((room) => room.id).toSet();
    final lastMessageByRoom = await loadLastMessagesByRoom(roomIds);
    // ------------------------------

    return rooms
        .map(
          (room) => RoomPreviewModel(
            room: room,
            displayName: displayName(room, currentUserId, usersMap),
            lastMessage: lastMessageByRoom[room.id],
          ),
        )
        .toList();
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<void> hideRoomForCurrentUser(String roomId) async {
    final currentUserId = _supabase.auth.currentUser!.id;
    final roomResponse = await _supabase
        .from('rooms')
        .select()
        .eq('id', roomId)
        .limit(1);
    if (roomResponse.isEmpty) return;

    final room = Map<String, dynamic>.from(roomResponse.first as Map);
    final metadata = Map<String, dynamic>.from(
      (room['metadata'] as Map?) ?? {},
    );
    final hiddenFor = List<String>.from(metadata['hiddenFor'] ?? []);

    if (!hiddenFor.contains(currentUserId)) {
      hiddenFor.add(currentUserId);
      metadata['hiddenFor'] = hiddenFor;
      await _supabase
          .from('rooms')
          .update({'metadata': metadata})
          .eq('id', roomId);
    }
  }

  // ===================================================================
  // ===================================================================
}
