import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/services/location_service.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home/presentation/pages/home_feature_screen.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'package:rehab/features/users/presentation/pages/users_feature_screen.dart';

class UserRootShell extends StatefulWidget {
  const UserRootShell({super.key});

  @override
  State<UserRootShell> createState() => _UserRootShellState();
}

class _UserRootShellState extends State<UserRootShell> {
  int _selectedIndex = 0;

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
        backgroundColor: Colors.white,
        body: Center(child: _pages.elementAt(_selectedIndex)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(blurRadius: 20, color: Colors.white.withAlpha(10)),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 8,
              ),
              child: GNav(
                rippleColor: Colors.grey[300]!,
                hoverColor: Colors.grey[100]!,
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: AppColors.primary,
                color: Colors.black,
                tabs: [
                  GButton(icon: Icons.home, text: 'Home'),
                  GButton(icon: Icons.chat, text: 'chat'),
                  GButton(icon: Icons.people, text: 'matching'),
                  GButton(icon: Icons.person, text: 'Profile'),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
