import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'my_bookings_di.config.dart'; 

@InjectableInit(
  initializerName: 'initMyBookings',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/my_bookings'],
)
void configureMyBookings(GetIt getIt) {
  getIt.initMyBookings();
}
