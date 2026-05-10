import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'home_details_di.config.dart'; 

@InjectableInit(
  initializerName: 'initHomeDetails',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/home_details'],
)
void configureHomeDetails(GetIt getIt) {
  getIt.initHomeDetails();
}
