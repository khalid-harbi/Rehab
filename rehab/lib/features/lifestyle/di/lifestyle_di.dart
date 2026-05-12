import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'lifestyle_di.config.dart'; 

@InjectableInit(
  initializerName: 'initLifestyle',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/lifestyle'],
)
void configureLifestyle(GetIt getIt) {
  getIt.initLifestyle();
}
