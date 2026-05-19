import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';
import 'package:rehab/features/owner/presentation/pages/owner_feature_screen.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';

class OwnerRootShell extends StatefulWidget {
  const OwnerRootShell({super.key});

  @override
  State<OwnerRootShell> createState() => _OwnerRootShellState();
}

class _OwnerRootShellState extends State<OwnerRootShell> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => OwnerCubit(GetIt.I.get()),
      child: const OwnerFeatureScreen(),
    ),

    const ChatFeatureScreen(),

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
