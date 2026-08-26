import 'package:go_router/go_router.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/chat/domain/entities/room_preview_entity.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';

/// جهة اتصال — صورة دائرية بإطار متدرّج فقط، والاسم تحتها.
/// تُستخدم في شريط «الأكثر تواصلًا» المثبّت أعلى صفحة المحادثات.
class ChatContactAvatar extends StatelessWidget {
  const ChatContactAvatar({super.key, required this.preview});

  final RoomPreviewEntity preview;

  static const double _size = 62;
  static const double _ringWidth = 2;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();

    return InkWell(
      onTap: () async {
        await context.push(Routes.conversation, extra: preview.room);
        if (context.mounted) cubit.fetchRooms();
      },
      borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
      child: SizedBox(
        width: 72,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // إطار متدرّج حول الصورة
            Container(
              width: _size,
              height: _size,
              padding: const EdgeInsets.all(_ringWidth),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.secondary, AppColors.primary],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.surface,
                ),
                child: CircleAvatar(
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
              ),
            ),

            const Gap(AppDimensions.spaceSm),

            Text(
              preview.displayName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
