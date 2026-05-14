import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'add_ad_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAddAd',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/add_ad'],
)
void configureAddAd(GetIt getIt) {
  getIt.initAddAd();
}
