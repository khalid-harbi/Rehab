// import 'package:geolocator/geolocator.dart';

// Future<bool> handleLocationPermission() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     return false;
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       return false;
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     return false;
//   }

//   return true;
// }
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseLocationService {
  Future<bool> handleLocationPermission();
  Future<void> openMap(double lat, double lng);
}

@LazySingleton(as: BaseLocationService)
class LocationServiceImpl implements BaseLocationService {
  
  // دمج ميثود الصلاحيات داخل الكلاس
  @override
  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    if (permission == LocationPermission.deniedForever) return false;

    return true;
  }

  // ميثود فتح الخريطة
  @override
  Future<void> openMap(double lat, double lng) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    final Uri uri = Uri.parse(googleMapsUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print("Could not launch $googleMapsUrl");
      }
    } catch (e) {
      print("Map Error: $e");
    }
  }
}