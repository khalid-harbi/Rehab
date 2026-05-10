import 'package:get_it/get_it.dart';
import 'package:rehab/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/features/auth/di/auth_di.dart';
import 'package:rehab/features/home/di/home_di.dart';
import 'package:rehab/features/profile/di/profile_di.dart';
import 'package:rehab/features/users/di/users_di.dart';
import 'package:rehab/features/sub/search/di/search_di.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  generateForDir: ['lib/core'],
)
Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
  configureHome(getIt);
  configureAuth(getIt);
  configureProfile(getIt);
  configureUsers(getIt);
    configureSearchSub(getIt);
}
