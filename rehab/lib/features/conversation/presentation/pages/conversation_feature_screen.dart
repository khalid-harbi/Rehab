import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' hide ChatState;
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/utils/display_user_name.dart';
import 'package:rehab/core/extensions/room_extensions.dart';
import 'package:rehab/features/conversation/presentation/cubit/conversation_cubit.dart';
import 'package:rehab/features/conversation/presentation/cubit/conversation_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConversationFeatureScreen extends StatelessWidget {
  // ===================================================================
  final types.Room room;
  // ===================================================================

  const ConversationFeatureScreen({super.key, required this.room});

  // ===================================================================
  // ===================================================================

  @override
  Widget build(BuildContext context) {
    // ===================================================================
    final cubit = context.read<ConversationCubit>();
    final userId = Supabase.instance.client.auth.currentUser!.id;
    final roomName = displayName(room, userId);
    final otherUser = room.getOtherUser(userId);
    // ===================================================================

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: otherUser.imageUrl != null
                  ? NetworkImage(otherUser.imageUrl!)
                  : null,
              child: otherUser.imageUrl == null
                  ? const Icon(Icons.person, size: 20)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                roomName,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),

      // ===================================================================
      // ===================================================================
      body: BlocConsumer<ConversationCubit, ConversationState>(
        listener: (context, state) {
          if (state is ConversationErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
              ),
            );
          }
        },
        builder: (context, state) {
          List<types.Message> currentMessages = [];

          if (state is ConversationMessagesLoadedState) {
            currentMessages = state.messages;
          }
          // ===================================================================
          // ===================================================================

          return Chat(
            messages: currentMessages,
            user: types.User(id: userId),
            onSendPressed: (types.PartialText message) {
              cubit.sendTextMessage(message.text, room.id);
            },
            showUserAvatars: false,
            showUserNames: false,
            theme: DefaultChatTheme(
              primaryColor: Theme.of(context).colorScheme.primary,
              inputBackgroundColor: Colors.grey[100]!,
              inputTextColor: Colors.black,
              inputTextCursorColor: Theme.of(context).colorScheme.primary,
              inputBorderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
              inputMargin: EdgeInsets.all(0),
              inputTextDecoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
              ),
              sentMessageBodyTextStyle: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
              receivedMessageBodyTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            l10n: const ChatL10nEn(inputPlaceholder: '...Write a message'),
            // Force the general date locale to English
            dateLocale: 'en',
            timeFormat: DateFormat.jm('en'),
            dateFormat: DateFormat('MMM d, yyyy', 'en'),
          );
        },
      ),
    );
  }
}
