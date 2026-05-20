import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/features/profile/presentation/cubit/theme/Theme_switcher_cubit.dart';
import 'core/setup.dart';
import 'core/theme/app_theme.dart';
import 'core/di/configure_dependencies.dart';
import 'core/navigation/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setup();
  await configureDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // ======================================================
  // ======================================================

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MainApp(),
    ),
  );
}

// ======================================================
// ======================================================

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeSwitcherCubit()),
        BlocProvider(create: (_) => ProfileCubit(GetIt.I.get())),

        // BlocProvider(create: (context) => GetIt.I<ProfileCubit>()..getProfileMethod()),
      ],

      // ======================================================
      // ======================================================
      child: BlocBuilder<ThemeSwitcherCubit, bool>(
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, screenType) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                themeMode: state ? ThemeMode.light : ThemeMode.dark,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
