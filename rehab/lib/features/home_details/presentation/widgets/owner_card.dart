import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_state.dart';

Widget buildOwnerContactCard(
  BuildContext context,
  UsersCubit cubit,
  ColorScheme colors,
  HomeEntity home,
) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: colors.surfaceContainerHighest.withAlpha(77),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: colors.outlineVariant.withAlpha(128)),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: colors.primary.withAlpha(25),
          child: Icon(Icons.person_outline, color: colors.primary),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "owner".tr(),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "askAboutProperty".tr(),
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
              ),
            ],
          ),
        ),

        // الزر كان بعرضه الطبيعي كاملًا: مع تسمية طويلة أو خط نظام مكبّر
        // يضغط الصف حتى يتجاوز. Flexible يسمح له بالانكماش.
        Flexible(
          child: BlocBuilder<UsersCubit, UsersState>(
            builder: (context, state) {
              final isLoading = state is UsersLoadingState;

              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onPressed: isLoading
                    ? null
                    : () => cubit.createRoom(home.ownerId),
                icon: isLoading
                    ? SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: colors.onPrimary,
                        ),
                      )
                    : const Icon(Icons.chat_bubble_outline, size: 18),
                label: Text(
                  "getInTouch".tr(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
