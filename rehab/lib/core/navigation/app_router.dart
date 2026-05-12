import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:rehab/core/navigation/owner_navigation_screen.dart';
import 'package:rehab/core/navigation/user_navigation_screen.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'routers.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/home_details/presentation/pages/home_details_feature_screen.dart';
import 'package:rehab/features/home_details/presentation/cubit/home_details_cubit.dart';
import 'package:rehab/features/booking/presentation/pages/booking_feature_screen.dart';
import 'package:rehab/features/owner/presentation/cubit/owner_cubit.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return Scaffold(body: Center(child: Text("splash screen")));
        }, // SplashScreen
      ),
    
  GoRoute(
    path: Routes.home,
    builder: (context, state) => BlocProvider(
          create: (context) => GetIt.I<HomeCubit>()..getHomeMethod(),
          child: const UserNavigationScreen(),
        ),
  ),

  GoRoute(
  path: Routes.homeDetails,
  builder: (context, state) {
    final home = state.extra as HomeEntity;
    return BlocProvider(
      create: (context) => HomeDetailsCubit(GetIt.I.get()),
      child: HomeDetailsFeatureScreen(home: home),
    );
  },
),

 GoRoute(
  path: Routes.booking,
  builder: (context, state) {
    final home = state.extra as HomeEntity;
    return BookingFeatureScreen(home: home);
  },
),

  GoRoute(
    path: Routes.owner,
    builder: (context, state) => BlocProvider(
          create: (context) => OwnerCubit(GetIt.I.get()),
          child: const OwnerNavigationScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
