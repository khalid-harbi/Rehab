import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rehab/features/home/presentation/pages/home_feature_screen.dart';

class MainNavigationScreen extends HookWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final selectedIndex = useState(0);

    final pages = const [
      HomeFeatureScreen(),
      Center(child: Text('المفضلة')),
      Center(child: Text('حسابي')),
    ];

    return Scaffold(
      body: pages[selectedIndex.value],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex.value,
        height: 60,
        backgroundColor: theme.scaffoldBackgroundColor,
        color: theme.colorScheme.secondary,
        buttonBackgroundColor: theme.colorScheme.primary,
        items: const [
          Icon(Icons.home_outlined, color: Colors.white),
          Icon(Icons.favorite_border, color: Colors.white),
          Icon(Icons.person_outline, color: Colors.white),
        ],
        onTap: (index) {
          selectedIndex.value = index;
        },
      ),
    );
  }
}