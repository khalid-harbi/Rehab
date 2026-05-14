import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'favorites_di.config.dart'; 

@InjectableInit(
  initializerName: 'initFavoritesSub',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/sub/favorites'],
)
void configureFavoritesSub(GetIt getIt) {
  getIt.initFavoritesSub();
}
