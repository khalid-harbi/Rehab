import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart' hide ChatState;
import 'package:rehab/core/utils/display_user_name.dart';
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
    // ===================================================================

    return Scaffold(
      appBar: AppBar(title: Text(displayName(room, userId))),

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
            showUserAvatars: true,
            showUserNames: true,
          );
        },
      ),
    );
  }
}
