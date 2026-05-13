import 'dart:io';

import 'package:any_image_view/any_image_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/features/auth/sub/logout/presentation/cubit/logout_cubit.dart';
import 'package:moyasar/moyasar.dart';
import 'package:rehab/core/services/payment.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart'
    show buildTextField, pickImageLocal;
import 'package:sizer/sizer.dart';
import 'package:rehab/core/widgets/loading_widget.dart';

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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "هل أنت متأكد أنك تريد تسجيل الخروج؟",
          style: TextStyle(color: Colors.white70),
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

  void showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
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
              const SizedBox(height: 20),
              CreditCard(
                config: Payment().initial(amount: 21.0),
                onPaymentResult: Payment().onPaymentResult,
              ),
              const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileSuccessState) {
                            return Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50.sp),
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
                      const Gap(24),
                      buildTextField(
                        controller: nameController,
                        label: "name".tr(),
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => Navigator.pop(dialogContext),
                            child: Text("cancel".tr()),
                          ),
                          const SizedBox(width: 8),
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
                pickImageLocal(
                  ImageSource.gallery,
                  setDialogState,
                  onFilePicked,
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text("camera".tr()),
              onTap: () {
                Navigator.pop(modalContext);
                pickImageLocal(
                  ImageSource.camera,
                  setDialogState,
                  onFilePicked,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
