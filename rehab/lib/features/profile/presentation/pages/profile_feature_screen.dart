import 'package:go_router/go_router.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/extensions/user_role_extension.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/logout/presentation/pages/logout_feature_widget.dart';
import 'package:rehab/features/profile/presentation/cubit/theme/Theme_switcher_cubit.dart';
import 'package:rehab/features/profile/presentation/widgets/language_switch_widhet.dart';
import 'package:rehab/features/profile/presentation/widgets/profile_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileFeatureScreen extends HookWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8),
          child: Text("profile".tr(), style: TextStyle(fontSize: 42)),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoadingState) {
              context.showLoading();
            } else {
              context.hideLoading();
            }

            if (state is ProfileErrorState) {
              context.showSnackBar(state.message, isError: true);
            }
          },
          builder: (context, state) {
            if (state is ProfileSuccessState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.sp),
                        child: InkWell(
                          onTap: () => showImageOptions(context),
                          child: AnyImageView(
                            imagePath:
                                state.profile.imageUrl ??
                                "https://placeholder.com/user.png",
                            width: 60.sp,
                            height: 60.sp,
                            fit: BoxFit.cover,
                            errorWidget: Icon(Icons.person, size: 30.sp),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.showEditProfileDialog(
                          context,
                          state.profile.name,
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),

                    Text(
                      state.profile.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (state.profile.role.toUserRole() != UserRole.owner)
                      ProfileWidget(
                        icon: const Icon(Icons.favorite_border),
                        title: "favorites",
                        onTap: () {
                          context.push(Routes.favorites);
                        },
                      ),
                    if (state.profile.role.toUserRole() != UserRole.owner)
                      ProfileWidget(
                        icon: const Icon(Icons.attach_money),
                        title: "bookings",
                        onTap: () {
                          context.push(Routes.myBookings);
                        },
                      ),
                    if (state.profile.role.toUserRole() != UserRole.owner)
                      ProfileWidget(
                        icon: const Icon(Icons.interests_outlined),
                        title: "lifestyle",
                        onTap: () => context.push(Routes.lifestyle),
                      ),
                    ProfileWidget(
                      icon: Icon(Icons.dark_mode_outlined),
                      title: "darkMode",
                      action: BlocBuilder<ThemeSwitcherCubit, bool>(
                        builder: (context, state) {
                          return Switch(
                            value: !state,
                            onChanged: (value) {
                              context.read<ThemeSwitcherCubit>().toggle();
                            },
                          );
                        },
                      ),
                    ),

                    ProfileWidget(
                      icon: Icon(Icons.language_rounded),
                      title: "language",
                      action: LanguageSwitchWidget(),
                    ),

                    Gap(2.sh),
                    ProfileWidget(
                      icon: const Icon(Icons.support_agent_outlined),
                      title: "help&support",
                      onTap: () {
                        showHelpAndSupportDialog(context);
                      },
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.info_outline),
                      title: "appInfo".tr(),
                      onTap: () => context.push(Routes.appInfo),
                    ),
                    LogoutFeatureWidget(),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

Widget buildTextField({
  required TextEditingController controller,
  required String label,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
  int maxLines = 1,
}) {
  return TextField(
    controller: controller,
    keyboardType: keyboardType,
    maxLines: maxLines,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, size: 20),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      filled: true,
      fillColor: Colors.grey.shade50,
    ),
  );
}

Future<void> pickImageLocal(
  ImageSource source,
  Function setDialogState,
  Function(File) onFilePicked,
) async {
  final picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: source, imageQuality: 70);

  if (image != null) {
    setDialogState(() {
      onFilePicked(File(image.path));
    });
  }
}

Future<void> launchSupportEmail(String emailPath) async {
  final Uri launchUri = Uri.parse(
    'mailto:$emailPath?subject=${Uri.encodeComponent('الدعم الفني - تطبيق رحاب')}',
  );

  try {
    await launchUrl(launchUri, mode: LaunchMode.externalApplication);
  } catch (e) {
    debugPrint('حدث خطأ أثناء محاولة فتح تطبيق البريد: $e');
  }
}
