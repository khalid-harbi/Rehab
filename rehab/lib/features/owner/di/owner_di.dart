import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'owner_di.config.dart';

@InjectableInit(
  initializerName: 'initOwner',
  // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/owner'],
)
void configureOwner(GetIt getIt) {
  getIt.initOwner();
}
