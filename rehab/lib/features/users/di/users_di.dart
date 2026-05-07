import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'users_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUsers',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/users'],
)
void configureUsers(GetIt getIt) {
  getIt.initUsers();
}
