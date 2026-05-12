import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/pages/home_feature_screen.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/pages/owner_feature_screen.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/pages/users_feature_screen.dart';

class OwnerRootShell extends StatefulWidget {
  const OwnerRootShell({super.key});

  @override
  State<OwnerRootShell> createState() => _OwnerRootShellState();
}

class _OwnerRootShellState extends State<OwnerRootShell> {
  OwnerSelectedTab _selectedTab = OwnerSelectedTab.home;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => OwnerCubit(GetIt.I.get()),
      child: const OwnerFeatureScreen(),
    ),

    const ChatFeatureScreen(),
    const ChatFeatureScreen(),

    BlocProvider(
      create: (context) => ProfileCubit(GetIt.I.get()),
      child: const ProfileFeatureScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(GetIt.I.get())..fetchRooms(),
      child: Scaffold(
        extendBody: true,

        body: IndexedStack(
          index: OwnerSelectedTab.values.indexOf(_selectedTab),
          children: _pages,
        ),

        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: OwnerSelectedTab.values.indexOf(_selectedTab),
          height: 10,
          unselectedItemColor: Colors.black,
          borderWidth: 2,
          outlineBorderColor: Colors.transparent,
          backgroundColor: Colors.white,
          onTap: (i) {
            setState(() {
              _selectedTab = OwnerSelectedTab.values[i];
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: AppColors.primary,
            ),
            CrystalNavigationBarItem(
              icon: Icons.add,
              unselectedIcon: Icons.add,
              selectedColor: Colors.amber,
            ),
            CrystalNavigationBarItem(
              icon: Icons.chat,
              unselectedIcon: Icons.chat_outlined,
              selectedColor: AppColors.primary,
            ),
            CrystalNavigationBarItem(
              icon: Icons.person,
              unselectedIcon: Icons.person_outline,
              selectedColor: AppColors.error,
            ),
          ],
        ),
      ),
    );
  }
}
