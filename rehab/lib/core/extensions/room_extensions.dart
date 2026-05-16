import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

extension RoomX on types.Room {
  types.User getOtherUser(String currentUserId) {
    return users.firstWhere(
      (user) => user.id != currentUserId,
      orElse: () => const types.User(id: ''),
    );
  }
}
