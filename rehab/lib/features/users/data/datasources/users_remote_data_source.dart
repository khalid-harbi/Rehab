import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/utils/supabase_users_map.dart';
import 'package:rehab/features/users/data/models/users_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseUsersRemoteDataSource {
  Future<List<UsersModel>> loadUsers();
  Future<types.Room> createChatRoom(String otherUserId);
}

// ===================================================================
// ===================================================================

@LazySingleton(as: BaseUsersRemoteDataSource)
class UsersRemoteDataSource implements BaseUsersRemoteDataSource {
  final SupabaseClient _supabase;

  UsersRemoteDataSource(this._supabase);

  // ===================================================================
  // ===================================================================

  @override
  Future<List<UsersModel>> loadUsers() async {
    final response = await _supabase.from("profiles").select();
    final users = response.map((user) => UsersModel.fromJson(user)).toList();
    return users;
  }

  // ===================================================================
  // ===================================================================

  Future<types.Room> buildRoomById(String roomId) async {
    // ---------------------
    // return the row with this roomId
    final response = await _supabase.from('rooms').select().eq('id', roomId);
    // ---------------------
    if (response.isEmpty) {
      throw Exception('Room not found');
    }

    // ---------------------

    // final roomMap = Map<String, dynamic>.from(response.first as Map);
    // it is a single [{}] element but we need .first to access the map
    final Map<String, dynamic> roomObject = response.first;

    // ---------------------

    // List<String>.from to create a copy List out of an existing List
    final userIds = List<String>.from((roomObject['userIds'] as List?) ?? []);
    // get users names
    final usersMap = await loadUsersNameMap(_supabase, userIds.toSet());
    // ---------------------

    // Users are required to build the room by the package
    final List<types.User> users = userIds
        // go through first then second user
        .map(
          (id) => types.User(
            id: id,
            firstName: usersMap[id], // access name by key 'id': 'name'
            metadata: {'name': usersMap[id]},
          ),
        )
        .toList();

    // ---------------------

    // build the room by the package
    return types.Room(
      id: roomObject['id'] as String,
      type: types.RoomType.direct,
      users: users,
      // name: roomObject['name']?.toString(),
      // imageUrl: roomObject['imageUrl']?.toString(),
      metadata: Map<String, dynamic>.from(
        (roomObject['metadata'] as Map?) ?? {},
      ),
      // createdAt: _toMillis(roomMap['createdAt']),
      // updatedAt: _toMillis(roomMap['updatedAt']),
    );
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<types.Room> createChatRoom(String otherUserId) async {
    try {
      // ---------------------
      final currentUserId = _supabase.auth.currentUser!.id;
      final List<String> participants = [currentUserId, otherUserId];
      // ---------------------

      // Take raw database response
      final List<Map<String, dynamic>> existingRooms = await _supabase
          .from('rooms')
          .select();
      // ---------------------

      final existingDirectRoom = existingRooms.firstWhere((room) {
        // (room) represents each room object in the map
        // .firstWhere() will check and return (true) or (false) for each room object

        // Extracts the 'userIds' from the room object
        // List<String>.from to create a copy List out of an existing List
        final userIds = List<String>.from((room['userIds'] as List?) ?? []);
        // ---------------------

        // if (true), the existing room object will be returned to existingDirectRoom
        return userIds.length == 2 &&
            userIds.contains(currentUserId) &&
            userIds.contains(otherUserId);
        // If no such room is found, return an empty map
      }, orElse: () => <String, dynamic>{});

      // ---------------------

      //@ ROOM EXISTS

      if (existingDirectRoom.isNotEmpty) {
        final roomId = existingDirectRoom['id'] as String;

        // Map<String, dynamic>.from to create a copy Map out of an existing Map
        final metadata = Map<String, dynamic>.from(
          (existingDirectRoom['metadata'] as Map?) ?? {},
        );

        // List<String>.from to create a copy List out of an existing List
        final hiddenFor = List<String>.from(metadata['hiddenFor'] ?? []);

        // If room was hidden by current user, unhide it when they start chat again
        if (hiddenFor.contains(currentUserId)) {
          hiddenFor.remove(currentUserId);
          // Re assign again
          metadata['hiddenFor'] = hiddenFor;
          // ---------------------

          await _supabase
              .from('rooms')
              .update({'metadata': metadata})
              .eq('id', roomId);
        }
        // build the room
        return buildRoomById(roomId);
      }
      // ---------------------

      //@ ROOM DOES NOT EXIST

      // Add the room to the database first
      final List<dynamic> response = await _supabase.from('rooms').insert({
        'userIds': participants,
        'metadata': {'hiddenFor': <String>[]},
      }).select();

      // ---------------------

      if (response.isEmpty) throw Exception("Failed to create room");

      // it is a single [{}] element but we need .first to access the map
      final roomId = response.first['id'];

      // ---------------------

      // build the room
      return buildRoomById(roomId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
