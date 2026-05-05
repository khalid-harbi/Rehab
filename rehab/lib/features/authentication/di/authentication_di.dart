import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'authentication_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAuthentication',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/authentication'],
)
void configureAuthentication(GetIt getIt) {
  getIt.initAuthentication();
}
