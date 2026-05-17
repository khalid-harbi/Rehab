import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rehab/core/common/sub/search/domain/use_cases/search_use_case.dart';
import 'package:rehab/core/constants/app_colors.dart';
import 'package:rehab/core/constants/app_enums.dart';
import 'package:rehab/core/services/location_service.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/pages/home_feature_screen.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/pages/users_feature_screen.dart';

class RootShell extends StatefulWidget {
  const RootShell({super.key});

  @override
  State<RootShell> createState() => _TaskCreatorFeatureScreenState();
}

class _TaskCreatorFeatureScreenState extends State<RootShell> {
  SelectedTab _selectedTab = SelectedTab.home;

  final List<Widget> _pages = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.I<HomeCubit>()..getHomeMethod(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            GetIt.I.get<SearchUseCase>(),
            GetIt.I.get<BaseLocationService>(),
          ),
        ),
      ],
      child: const HomeFeatureScreen(),
    ),

    const ChatFeatureScreen(),
    BlocProvider(
      create: (context) => UsersCubit(GetIt.I.get()),
      child: const UsersFeatureScreen(),
    ),

    const ProfileFeatureScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(GetIt.I.get())..fetchRooms(),
      child: Scaffold(
        extendBody: true,

        body: IndexedStack(
          index: SelectedTab.values.indexOf(_selectedTab),
          children: _pages,
        ),

        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: SelectedTab.values.indexOf(_selectedTab),
          height: 10,
          unselectedItemColor: Colors.black,
          borderWidth: 2,
          outlineBorderColor: Colors.transparent,
          backgroundColor: Colors.white,
          onTap: (i) {
            setState(() {
              _selectedTab = SelectedTab.values[i];
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: AppColors.primary,
            ),
            CrystalNavigationBarItem(
              icon: Icons.chat,
              unselectedIcon: Icons.chat_outlined,
              selectedColor: AppColors.primary,
            ),
            CrystalNavigationBarItem(
              icon: Icons.people,
              unselectedIcon: Icons.people_outline,
              selectedColor: Colors.amber,
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
