// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:rehab/features/owner/presentation/pages/owner_feature_screen.dart';

// class OwnerNavigationScreen extends HookWidget {
//   const OwnerNavigationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final selectedIndex = useState(0);

//     final pages = const [
//       OwnerFeatureScreen(),
//       Center(child: Text('عقاراتي')),
//       Center(child: Text('الحجوزات')),
//     ];

//     return Scaffold(
//       body: pages[selectedIndex.value],
//       bottomNavigationBar: CurvedNavigationBar(
//         index: selectedIndex.value,
//         height: 60,
//         backgroundColor: theme.scaffoldBackgroundColor,
//         color: theme.colorScheme.primary,
//         buttonBackgroundColor: theme.colorScheme.primary,
//         items: const [
//           Icon(Icons.dashboard_outlined, color: Colors.white),
//           Icon(Icons.apartment_outlined, color: Colors.white),
//           Icon(Icons.calendar_month_outlined, color: Colors.white),
//         ],
//         onTap: (index) {
//           selectedIndex.value = index;
//         },
//       ),
//     );
//   }
// }