import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_cubit.dart';
import 'package:rehab/core/common/sub/search/presentation/pages/search_feature_screen.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/services/location_service.dart';
import 'package:rehab/features/ads/presentation/cubit/ads_cubit.dart';
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

  void _goToTab(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    // كل الكيوبتس على مستوى الشل عشان الهوم وتبويب البحث يشتغلان
    // على نفس الحالة، وما تنعاد التحميلات مع كل تنقّل بين التبويبات.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit(GetIt.I.get())),
        BlocProvider(
          create: (context) => GetIt.I<HomeCubit>()..getHomeMethod(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(
            GetIt.I.get<SearchUseCase>(),
            GetIt.I.get<BaseLocationService>(),
          )..getSearchMethod(title: ''),
        ),
        BlocProvider(create: (context) => GetIt.I<AdsCubit>()..getAdsMethod()),
        BlocProvider(create: (context) => UsersCubit(GetIt.I.get())),
      ],
      child: Scaffold(
        backgroundColor: AppColors.background,
        // IndexedStack يحافظ على حالة كل تبويب (السكرول، نص البحث) عند التنقّل.
        body: IndexedStack(
          index: _selectedIndex,
          children: [
            HomeFeatureScreen(onNavigateToTab: _goToTab),
            const SearchFeatureScreen(),
            const ChatFeatureScreen(),
            const UsersFeatureScreen(),
            const ProfileFeatureScreen(),
          ],
        ),
        bottomNavigationBar: _BottomNavBar(
          selectedIndex: _selectedIndex,
          onTabChange: _goToTab,
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.selectedIndex, required this.onTabChange});

  final int selectedIndex;
  final ValueChanged<int> onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.spaceSm,
            vertical: AppDimensions.spaceSm,
          ),
          child: GNav(
            rippleColor: AppColors.primary.withAlpha(20),
            hoverColor: AppColors.primary.withAlpha(15),
            gap: 6,
            activeColor: Colors.white,
            iconSize: 20,
            textSize: 12,
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.spaceMd,
              vertical: AppDimensions.spaceMd,
            ),
            duration: const Duration(milliseconds: 320),
            tabBackgroundColor: AppColors.primary,
            color: AppColors.textSecondary,
            tabs: [
              GButton(icon: Icons.home_rounded, text: "home".tr()),
              GButton(icon: Icons.search_rounded, text: "search".tr()),
              GButton(icon: Icons.chat_bubble_rounded, text: "chat".tr()),
              GButton(icon: Icons.people_alt_rounded, text: "matching".tr()),
              GButton(icon: Icons.person_rounded, text: "profile".tr()),
            ],
            selectedIndex: selectedIndex,
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }
}
