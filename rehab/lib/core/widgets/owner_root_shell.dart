import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:rehab/core/constants/app_dimensions.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/owner/presentation/pages/owner_feature_screen.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';

/// إطار تطبيق المالكة.
///
/// كان شريطه السفلي بلغة بصرية مختلفة عن شريط المستخدمة (أيقونات سوداء
/// بحجم مختلف وظل أبيض غير مرئي)، وكان يبني الصفحات في قائمة ثابتة فتفقد
/// حالتها مع كل تنقّل. الآن نفس الشريط ونفس `IndexedStack` تمامًا.
class OwnerRootShell extends StatefulWidget {
  const OwnerRootShell({super.key});

  @override
  State<OwnerRootShell> createState() => _OwnerRootShellState();
}

class _OwnerRootShellState extends State<OwnerRootShell> {
  int _selectedIndex = 0;

  void _goToTab(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(GetIt.I.get())..fetchRooms(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            OwnerFeatureScreen(),
            ChatFeatureScreen(),
            ProfileFeatureScreen(),
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

/// نسخة طبق الأصل من شريط صفحة المستخدمة، بثلاثة تبويبات بدل خمسة.
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
              GButton(icon: Icons.dashboard_rounded, text: "dashboard".tr()),
              GButton(icon: Icons.chat_bubble_rounded, text: "chat".tr()),
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
