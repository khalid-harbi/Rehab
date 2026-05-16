import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_state.dart';
import 'package:rehab/features/chat/presentation/widgets/delete_room_confirmation_dialog.dart';

class ChatFeatureScreen extends StatelessWidget {
  const ChatFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ===================================================================
    final cubit = context.read<ChatCubit>();
    // ===================================================================
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats".tr(), style: TextStyle(fontSize: 36)),
        centerTitle: false,
      ),
      // ===================================================================
      // ===================================================================
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          // ===================================================================

          if (state is ChatLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ChatErrorState) {
            return Center(child: Text(state.message));
            // ===================================================================
            // ===================================================================
          } else if (state is ChatLoadedState) {
            if (state.roomPreviews.isEmpty) {
              return const Center(child: Text("لا توجد محادثات بعد"));
            }
            return ListView.builder(
              itemCount: state.roomPreviews.length,
              itemBuilder: (context, index) {
                final preview = state.roomPreviews[index];
                final room = preview.room;
                // ===================================================================

                return Slidable(
                  key: ValueKey(room.id),
                  startActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          final confirmed =
                              await showDeleteRoomConfirmationDialog(context);
                          if (!context.mounted) return;
                          if (confirmed == true) {
                            await cubit.hideRoomForCurrentUser(room.id);
                          }
                        },
                        icon: Icons.delete_outline,
                        label: "حذف",
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: preview.avatarUrl != null
                          ? NetworkImage(preview.avatarUrl!)
                          : null,
                      child: preview.avatarUrl == null
                          ? const Icon(Icons.person)
                          : null,
                    ),
                    title: Text(preview.displayName),
                    subtitle: Text(
                      preview.lastMessage ?? "لا توجد رسائل بعد",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () async {
                      // await context.push(Routes.conversation, extra: room);
                      await context.push(Routes.conversation, extra: room);

                      // Are we in home screen?
                      if (context.mounted) {
                        // Refresh after returning from the chat screen
                        cubit.fetchRooms();
                      }
                    },
                  ),
                );
                // ===================================================================
              },
            );
          }
          // ===================================================================
          // ===================================================================

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
