import 'dart:ui' as ui;

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/core/widgets/app_top_bar.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_state.dart';
import 'package:rehab/features/chat/presentation/widgets/chat_contact_avatar.dart';
import 'package:rehab/features/chat/presentation/widgets/delete_room_confirmation_dialog.dart';

/// عدد جهات الاتصال في الشريط المثبّت أعلى الصفحة.
const int _kTopContactsCount = 5;

class ChatFeatureScreen extends StatelessWidget {
  const ChatFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppTopBar(title: "chats".tr()),
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoadingState || state is ChatInitialState) {
            return const Center(child: LoadingWidget());
          }

          if (state is ChatErrorState) {
            return _EmptyState(
              icon: Icons.error_outline_rounded,
              message: state.message,
            );
          }

          if (state is! ChatLoadedState) {
            return const SizedBox.shrink();
          }

          if (state.roomPreviews.isEmpty) {
            return _EmptyState(
              icon: Icons.forum_outlined,
              message: "noChatsYet".tr(),
            );
          }

          // الأكثر تواصلًا = الأحدث نشاطًا في المحادثة.
          final byActivity = [...state.roomPreviews]
            ..sort(
              (first, second) => (second.room.updatedAt ?? 0).compareTo(
                first.room.updatedAt ?? 0,
              ),
            );

          final topContacts = byActivity.take(_kTopContactsCount).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ــــــ شريط الأكثر تواصلًا، مثبّت أعلى الصفحة ــــــ
              _TopContactsBar(contacts: topContacts),

              const Divider(height: 1, color: AppColors.border),

              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppDimensions.screenPadding,
                  AppDimensions.spaceLg,
                  AppDimensions.screenPadding,
                  AppDimensions.spaceSm,
                ),
                child: Text(
                  "allChats".tr(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),

              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    AppDimensions.screenPadding,
                    0,
                    AppDimensions.screenPadding,
                    AppDimensions.spaceXl,
                  ),
                  itemCount: byActivity.length,
                  separatorBuilder: (context, index) =>
                      const Gap(AppDimensions.spaceSm),
                  itemBuilder: (context, index) =>
                      _ChatTile(preview: byActivity[index]),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

// ===================================================================
// شريط الأكثر تواصلًا
// ===================================================================

class _TopContactsBar extends StatelessWidget {
  const _TopContactsBar({required this.contacts});

  final List<RoomPreviewEntity> contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.spaceLg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppDimensions.screenPadding,
              0,
              AppDimensions.screenPadding,
              AppDimensions.spaceMd,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.bolt_rounded,
                  size: AppDimensions.iconMd,
                  color: AppColors.primary,
                ),
                const Gap(AppDimensions.spaceSm),
                Text(
                  "mostContacted".tr(),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 96,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.screenPadding,
              ),
              itemCount: contacts.length,
              separatorBuilder: (context, index) =>
                  const Gap(AppDimensions.spaceMd),
              itemBuilder: (context, index) =>
                  ChatContactAvatar(preview: contacts[index]),
            ),
          ),
        ],
      ),
    );
  }
}

// ===================================================================
// كارد المحادثة
// ===================================================================

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.preview});

  final RoomPreviewEntity preview;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final room = preview.room;

    return Slidable(
      key: ValueKey(room.id),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.25,
        children: [
          SlidableAction(
            onPressed: (_) async {
              final confirmed = await showDeleteRoomConfirmationDialog(context);
              if (!context.mounted) return;
              if (confirmed == true) {
                await cubit.hideRoomForCurrentUser(room.id);
              }
            },
            icon: Icons.delete_outline_rounded,
            label: "delete".tr(),
            backgroundColor: AppColors.error,
            foregroundColor: Colors.white,
            borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
          ),
        ],
      ),
      child: InkWell(
        onTap: () async {
          await context.push(Routes.conversation, extra: room);
          if (context.mounted) cubit.fetchRooms();
        },
        borderRadius: BorderRadius.circular(AppDimensions.radiusLg),
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.spaceMd),
          decoration: AppDimensions.surfaceCard,
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withAlpha(25),
                backgroundImage: preview.avatarUrl != null
                    ? NetworkImage(preview.avatarUrl!)
                    : null,
                child: preview.avatarUrl == null
                    ? const Icon(
                        Icons.person,
                        size: AppDimensions.iconLg,
                        color: AppColors.primary,
                      )
                    : null,
              ),

              const Gap(AppDimensions.spaceMd),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      preview.displayName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),

                    const Gap(3),

                    Text(
                      preview.lastMessage ?? "noMessagesYet".tr(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(AppDimensions.spaceSm),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _relativeTime(context, room.updatedAt),
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const Gap(AppDimensions.spaceSm),

                  Icon(
                    Directionality.of(context) == ui.TextDirection.rtl
                        ? Icons.chevron_left_rounded
                        : Icons.chevron_right_rounded,
                    size: AppDimensions.iconMd,
                    color: AppColors.textSecondary.withAlpha(120),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// وقت مختصر لآخر نشاط في المحادثة.
String _relativeTime(BuildContext context, int? millis) {
  if (millis == null) return '';

  final difference = DateTime.now().difference(
    DateTime.fromMillisecondsSinceEpoch(millis),
  );

  if (difference.inMinutes < 1) return "now".tr();
  if (difference.inHours < 1) return "minutesAgo".plural(difference.inMinutes);
  if (difference.inDays < 1) return "hoursAgo".plural(difference.inHours);
  if (difference.inDays < 7) return "daysAgo".plural(difference.inDays);

  return DateFormat.yMd(
    context.locale.languageCode,
  ).format(DateTime.fromMillisecondsSinceEpoch(millis));
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 44, color: AppColors.textSecondary.withAlpha(120)),
          const Gap(AppDimensions.spaceMd),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceXl,
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
