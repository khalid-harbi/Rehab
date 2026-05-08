import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/core/widgets/root_shell.dart';
import 'package:rehab/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rehab/features/auth/presentation/cubit/auth_state.dart';
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_cubit.dart';
import 'package:rehab/features/auth/sub/login/presentation/pages/login_feature_widget.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/pages/sign_up_feature_widget.dart';
import 'routers.dart';
import 'package:rehab/features/home/presentation/pages/home_feature_screen.dart';
import 'package:rehab/features/home/presentation/cubit/home_cubit.dart';
import 'package:rehab/features/profile/presentation/pages/profile_feature_screen.dart';
import 'package:rehab/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:rehab/features/users/presentation/pages/users_feature_screen.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';



class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: Routes.splash,
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => AuthCubit(GetIt.I.get()),
            child: Scaffold(
              body: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  switch (state) {
                    case AuthSuccessState _:
                      if (state.isLogin) {
                        context.go(Routes.home);
                        return;
                      }
                      context.go(Routes.signUp);
                      break;
                    case AuthErrorState _:
                      context.showSnackBar(state.message);
                      break;
                    default:
                  }
                },
                child: Center(child: LoadingWidget()),
              ),
            ),
          );
        }, // SplashScreen
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(GetIt.I.get()),
          child: const LoginFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.signUp,
        builder: (context, state) => BlocProvider(
          create: (context) => SignUpCubit(GetIt.I.get()),
          child: const SignUpFeatureScreen(),
        ),
      ),
       GoRoute(
        path: Routes.home,
        builder: (context, state) => const RootShell(),
      ),
      // GoRoute(
      //   path: Routes.home,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => HomeCubit(GetIt.I.get()),
      //     child: const HomeFeatureScreen(),
      //   ),
      // ),
    
  GoRoute(
    path: Routes.profile,
    builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(GetIt.I.get()),
          child: const ProfileFeatureScreen(),
        ),
  ),

  GoRoute(
    path: Routes.users,
    builder: (context, state) => BlocProvider(
          create: (context) => UsersCubit(GetIt.I.get()),
          child: const UsersFeatureScreen(),
        ),
  ),
],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
