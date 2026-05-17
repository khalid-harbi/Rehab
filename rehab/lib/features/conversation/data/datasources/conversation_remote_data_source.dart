import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_supabase_chat_core/flutter_supabase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/utils/supabase_timestamp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseConversationRemoteDataSource {
  Stream<List<types.Message>> getMessages(types.Room room);
  Future<void> sendMessage(String text, String roomId);
  Future<types.Room> createRoom(String otherUserId);
}

@LazySingleton(as: BaseConversationRemoteDataSource)
class ConversationRemoteDataSource implements BaseConversationRemoteDataSource {
  final _chatCore = SupabaseChatCore.instance;
  final SupabaseClient _supabase;

  ConversationRemoteDataSource(this._supabase);

  // ===================================================================
  // ===================================================================

  int _messageTime(types.Message message) => message.createdAt ?? 0;

  // ===================================================================
  // ===================================================================

  @override
  Stream<List<types.Message>> getMessages(types.Room room) {
    //! I had to search for this
    // ------------------------------------------

    return _supabase
        .from('messages')
        .stream(primaryKey: ['id'])
        .eq('roomId', room.id)
        .order('createdAt', ascending: false)
        .map((maps) {
          final List<types.Message> parsedMessages = [];

          // ------------------------------------------

          for (final map in maps) {
            try {
              // Translate 'content' column to 'text' key the Package expects
              map['text'] = map['content'];

              // ------------------------------------------

              // Match authorId to the room users
              final authorId = map['authorId']?.toString() ?? '';

              // Find the user in the room's users list to get their image
              final authorUser = room.users.firstWhere(
                (user) => user.id == authorId,
                orElse: () => types.User(id: authorId), // fallback if not found
              );

              // ------------------------------------------

              // The Package requires a nested 'author' map
              map['author'] = {
                'id': authorUser.id,
                'firstName': authorUser.firstName,
                'imageUrl': authorUser.imageUrl,
              };

              // Ensure the type matches what the package expects
              map['type'] = map['type'] ?? 'text';
              map['createdAt'] = supabaseValueToMillis(map['createdAt']);
              // map['updatedAt'] = supabaseValueToMillis(map['updatedAt']);

              parsedMessages.add(types.Message.fromJson(map));
            } catch (e) {
              // log corrupted message without breaking the whole stream
              debugPrint("Failed to parse message ${map['id']}: $e");
            }
          }
          // ------------------------------------------

          // flutter_chat_ui package expects newest-first list ordering
          parsedMessages.sort(
            (a, b) => _messageTime(b).compareTo(_messageTime(a)),
          );

          return parsedMessages;
        });
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<void> sendMessage(String text, String roomId) async {
    final userId = _supabase.auth.currentUser!.id;

    await _supabase.from('messages').insert({
      'roomId': roomId,
      'authorId': userId,
      'content': text,
      'type': 'text',
      'status': 'sent',
    });
  }

  // ===================================================================
  // ===================================================================

  @override
  Future<types.Room> createRoom(String otherUserId) async {
    final otherUser = types.User(id: otherUserId);
    return await _chatCore.createRoom(otherUser);
  }

  // ===================================================================
  // ===================================================================
}
