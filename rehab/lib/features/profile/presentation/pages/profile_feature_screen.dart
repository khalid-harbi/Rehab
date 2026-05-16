import 'dart:io';

import 'package:any_image_view/any_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/navigation/routers.dart';
import 'package:rehab/features/auth/sub/logout/presentation/pages/logout_feature_widget.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_state.dart';
import 'package:rehab/features/profile/presentation/widgets/profile_widget.dart';
import 'package:sizer/sizer.dart';

class ProfileFeatureScreen extends StatelessWidget {
  const ProfileFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr(), style: TextStyle(fontSize: 36)),
        centerTitle: false,
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

                    ProfileWidget(
                      icon: Icon(Icons.favorite),
                      title: "favorites",
                      onTap: () {
                     context.push(Routes.favorites);
                      },

                    ),
                    ProfileWidget(
                      icon: Icon(Icons.attach_money),
                      title: "bookings",
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.interests_outlined),
                      title: "lifestyle",
                      onTap: () => context.push(Routes.lifestyle),
                    ),

                    ProfileWidget(
                      icon: Icon(Icons.dark_mode_outlined),
                      title: "darkMode",
                    ),
                    ProfileWidget(
                      icon: Icon(Icons.language),
                      title: "language",
                    ),

                    ProfileWidget(
                      icon: Icon(Icons.settings),
                      title: "settings",
                    ),
                    Gap(2.sh),
                    ProfileWidget(
                      icon: Icon(Icons.support_agent_outlined),
                      title: "help&support",
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
