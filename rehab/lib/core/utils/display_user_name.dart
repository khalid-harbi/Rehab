import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

String displayName(types.Room room, String currentUserId) {
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

  final roomName = room.name?.trim();
  if (roomName != null && roomName.isNotEmpty) return roomName;

  return 'Chat';
}
