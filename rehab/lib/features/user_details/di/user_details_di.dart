import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'user_details_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUserDetails',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/user_details'],
)
void configureUserDetails(GetIt getIt) {
  getIt.initUserDetails();
}
