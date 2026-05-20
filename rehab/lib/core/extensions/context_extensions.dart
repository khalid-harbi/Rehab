import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/auth/sub/otp/presentation/cubit/otp_cubit.dart';
import 'package:rehab/features/auth/sub/otp/presentation/pages/otp_feature_widget.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
export 'package:easy_localization/easy_localization.dart';

extension ContextExtensions on BuildContext {
  // Snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  void showLoading() {
    LoadingWidgetOverlay().show(this);
  }

  void hideLoading() {
    LoadingWidgetOverlay().hide();
  }

  void showLogoutDialog(BuildContext context, LogoutCubit cubit) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.background,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "تسجيل الخروج",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: TextStyle(color: Colors.black54),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("إلغاء", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.getLogoutMethod();
            },
            child: const Text(
              "تسجيل الخروج",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet({required Widget widget, double? height, Color? color}) {
    showModalBottomSheet(
      context: this,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      clipBehavior: .hardEdge,
      builder: (context) => Container(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
        height: height ?? 75.h,
        width: 100.w,
        color: color,
        child: widget,
      ),
    );
  }

  void showPaymentBottomSheet({
    required double amount,
    required String description,
    required VoidCallback onPaid,
  }) {
    showModalBottomSheet(
      context: this,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (bottomSheetContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(bottomSheetContext).viewInsets.bottom,
          top: 20,
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "الدفع الآمن",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              Gap(20),

              CreditCard(
                config: Payment().initial(
                  amount: amount,
                  description: description,
                ),
                onPaymentResult: (result) async {
                  final isPaid = await Payment().onPaymentResult(result);

                  if (isPaid) {
                    Navigator.pop(bottomSheetContext);
                    onPaid();
                  } else {
                    showSnackBar('فشلت عملية الدفع', isError: true);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showEditProfileDialog(BuildContext context, String currentName) {
    final nameController = TextEditingController(text: currentName);
    final profileCubit = context.read<ProfileCubit>();
    File? pickedImageFile;

    showDialog(
      context: context,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return BlocProvider.value(
            value: profileCubit,
            child: Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "edit profile".tr(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(20),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileSuccessState) {
                            return Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(50.sp),
                                    onTap: () => showImageOptionsForDialog(
                                      context,
                                      setDialogState,
                                      (file) => pickedImageFile = file,
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        50.sp,
                                      ),
                                      child: pickedImageFile != null
                                          ? Image.file(
                                              pickedImageFile!,
                                              width: 60.sp,
                                              height: 60.sp,
                                              fit: BoxFit.cover,
                                            )
                                          : AnyImageView(
                                              imagePath:
                                                  state.profile.imageUrl ??
                                                  "https://placeholder.com/user.png",
                                              width: 60.sp,
                                              height: 60.sp,
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 15,
                                    child: IconButton(
                                      onPressed: () =>
                                          showImageOptionsForDialog(
                                            context,
                                            setDialogState,
                                            (file) => pickedImageFile = file,
                                          ),
                                      icon: const Icon(
                                        Icons.camera_alt,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Gap(24),
                      // buildTextField(
                      //   controller: nameController,
                      //   label: "name".tr(),
                      //   icon: Icons.person_outline,
                      // ),
                      Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(dialogContext),
                            child: Text("cancel".tr()),
                          ),
                          Gap(8),
                          ElevatedButton(
                            onPressed: () {
                              if (pickedImageFile != null) {
                                profileCubit.updateProfileImage(
                                  pickedImageFile!,
                                );
                              }
                              profileCubit.updateProfileName(
                                nameController.text,
                              );
                              Navigator.pop(dialogContext);
                            },
                            child: Text("save".tr()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showImageOptionsForDialog(
    BuildContext context,
    Function setDialogState,
    Function(File) onFilePicked,
  ) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text("gallery".tr()),
              onTap: () {
                Navigator.pop(modalContext);
                // pickImageLocal(
                //   ImageSource.gallery,
                //   setDialogState,
                //   onFilePicked,
                // );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text("camera".tr()),
              onTap: () {
                Navigator.pop(modalContext);
                // pickImageLocal(
                //   ImageSource.camera,
                //   setDialogState,
                //   onFilePicked,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void openOtpBottomSheet(BuildContext context, String email) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (modalContext) {
      return BlocProvider(
        create: (context) => OtpCubit(GetIt.I.get()),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(modalContext).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 65.h,
            child: OtpFeatureScreen(email: email),
          ),
        ),
      );
    },
  );
}

Future<void> showImageOptions(BuildContext context) async {
  final picker = ImagePicker();

  showModalBottomSheet(
    context: context,
    builder: (_) {
      return SafeArea(
        child: Row(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text("Gallery"),
              onTap: () async {
                Navigator.pop(context);

                final image = await picker.pickImage(
                  source: ImageSource.gallery,
                  imageQuality: 70,
                );

                if (image != null && context.mounted) {
                  context.read<ProfileCubit>().updateProfileImage(
                    File(image.path),
                  );
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text("Camera"),
              onTap: () async {
                Navigator.pop(context);

                final image = await picker.pickImage(
                  source: ImageSource.camera,
                  imageQuality: 70,
                );

                if (image != null && context.mounted) {
                  context.read<ProfileCubit>().updateProfileImage(
                    File(image.path),
                  );
                }
              },
            ),
          ],
        ),
      );
    },
  );
}

void showHelpAndSupportDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(Icons.support_agent_outlined, color: Colors.blue),
            const SizedBox(width: 10),
            Text("help&support".tr()),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "تواصل معنا عبر البريد الإلكتروني لفريق الدعم:",
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),

            InkWell(
              onTap: () async {
                Navigator.pop(context);
                // await launchSupportEmail('rehabtuwaiq@gmail.com');
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50.withAlpha(50),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blue.shade200),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.email_outlined, color: Colors.blue),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'rehabtuwaiq@gmail.com',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.open_in_new,
                      size: 16,
                      color: Colors.blue.shade300,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'إغلاق',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
    },
  );
}
