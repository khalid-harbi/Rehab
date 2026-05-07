import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'booking_di.config.dart'; 

@InjectableInit(
  initializerName: 'initBooking',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/booking'],
)
void configureBooking(GetIt getIt) {
  getIt.initBooking();
}
