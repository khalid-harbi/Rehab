import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'ads_di.config.dart';

@InjectableInit(
  initializerName: 'initAds',
  generateForDir: ['lib/features/ads'],
)
void configureAds(GetIt getIt) {
  getIt.initAds();
}
