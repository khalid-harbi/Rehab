import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:rehab/core/common/sub/favorites/presentation/cubit/favorites_cubit.dart';
import 'package:rehab/core/common/sub/favorites/presentation/pages/favorites_feature_widget.dart';
import 'package:rehab/core/extensions/context_extensions.dart';
import 'package:rehab/core/widgets/loading_widget.dart';
import 'package:rehab/core/widgets/owner_root_shell.dart';
import 'package:rehab/core/widgets/root_shell.dart';
import 'package:rehab/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rehab/features/auth/presentation/cubit/auth_state.dart';
import 'package:rehab/features/auth/presentation/pages/auth_feature_screen.dart';
import 'package:rehab/features/auth/sub/login/presentation/cubit/login_cubit.dart';
import 'package:rehab/features/auth/sub/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:rehab/features/booking/presentation/cubit/booking_cubit.dart';
import 'package:rehab/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:rehab/features/chat/presentation/pages/chat_feature_screen.dart';
import 'package:rehab/features/conversation/presentation/cubit/conversation_cubit.dart';
import 'package:rehab/features/conversation/presentation/pages/conversation_feature_screen.dart';
import 'package:rehab/features/home/domain/entities/home_entity.dart';
import 'package:rehab/features/profile/presentation/cubit/profile/profile_cubit.dart';
import 'package:rehab/features/home_details/presentation/cubit/home_details_cubit.dart';
import 'package:rehab/features/profile/presentation/pages/app_info_screen.dart';
import 'package:rehab/features/users/domain/entities/users_entity.dart';
import 'package:rehab/features/users/presentation/cubit/users_cubit.dart';
import 'routers.dart';
import 'package:rehab/features/home_details/presentation/pages/home_details_feature_screen.dart';
import 'package:rehab/features/booking/presentation/pages/booking_feature_screen.dart';
import 'package:rehab/features/lifestyle/presentation/pages/lifestyle_feature_screen.dart';
import 'package:rehab/features/lifestyle/presentation/cubit/lifestyle_cubit.dart';
import 'package:rehab/features/add_ad/presentation/pages/add_ad_feature_screen.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_cubit.dart';
import 'package:rehab/features/my_bookings/presentation/pages/my_bookings_feature_screen.dart';
import 'package:rehab/features/my_bookings/presentation/cubit/my_bookings_cubit.dart';
import 'package:rehab/features/user_details/presentation/pages/user_details_feature_screen.dart';
import 'package:rehab/features/user_details/presentation/cubit/user_details_cubit.dart';

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
                      }
                      context.go(Routes.auth);
                    case AuthErrorState _:
                      context.showSnackBar(state.message, isError: true);
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
        path: Routes.auth,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => GetIt.I<AuthCubit>()),
              BlocProvider(create: (context) => GetIt.I<LoginCubit>()),
              BlocProvider(create: (context) => GetIt.I<SignUpCubit>()),
            ],
            child: const AuthFeatureScreen(),
          );
        },
      ),

      GoRoute(
        path: Routes.homeDetails,
        builder: (context, state) {
          final home = state.extra as HomeEntity;
          return MultiBlocProvider(
            providers: [
              // BlocProvider(
              //   create: (context) => HomeDetailsCubit(GetIt.I.get()),
              // ),
              BlocProvider(create: (context) => GetIt.I<FavoritesCubit>()),
              BlocProvider(create: (context) => UsersCubit(GetIt.I.get())),
            ],
            child: HomeDetailsFeatureScreen(home: home),
          );
        },
      ),

      GoRoute(
        path: Routes.home,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(GetIt.I.get()),
          child: const RootShell(),
        ),
      ),

      GoRoute(
        path: Routes.chat,
        builder: (context, state) => BlocProvider(
          create: (context) => ChatCubit(GetIt.I.get()),
          child: const ChatFeatureScreen(),
        ),
      ),
      GoRoute(
        path: Routes.conversation,
        builder: (context, state) {
          // ensure extra is a Room object to avoid null errors
          if (state.extra is types.Room) {
            final room = state.extra as types.Room;

            return BlocProvider(
              create: (context) =>
                  ConversationCubit(GetIt.I.get())..listenToMessages(room),
              child: ConversationFeatureScreen(room: room),
            );
          }
          // If no room is passed
          return SizedBox.shrink();
        },
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

          return BlocProvider(
            create: (context) => BookingCubit(GetIt.I.get()),
            child: BookingFeatureScreen(home: home),
          );
        },
      ),

      GoRoute(
        path: Routes.owner,
        builder: (context, state) => BlocProvider(
          create: (context) => ProfileCubit(GetIt.I.get()),
          child: const OwnerRootShell(),
        ),
      ),

      GoRoute(
        path: Routes.lifestyle,
        builder: (context, state) => BlocProvider(
          create: (context) => LifestyleCubit(GetIt.I.get()),
          child: const LifestyleFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.addAd,
        builder: (context, state) => BlocProvider(
          create: (context) => AddAdCubit(GetIt.I.get()),
          child: const AddAdFeatureScreen(),
        ),
      ),

      GoRoute(
        path: Routes.favorites,
        builder: (context, state) => const FavoritesFeatureWidget(),
      ),
      GoRoute(
        path: Routes.appInfo,
        builder: (context, state) => const AppInfoScreen(),
      ),

      GoRoute(
        path: Routes.myBookings,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                GetIt.I<MyBookingsCubit>()..getMyBookingsMethod(),
            child: const MyBookingsFeatureScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.userDetails,
        builder: (context, state) {
          final user = state.extra as UsersEntity?;
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => UserDetailsCubit(GetIt.I.get()),
              ),
              // Add the UsersCubit provider here!
              BlocProvider(create: (context) => UsersCubit(GetIt.I.get())),
            ],
            child: UserDetailsFeatureScreen(fetchedUser: user),
          );
        },
      ),
    ],

    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
