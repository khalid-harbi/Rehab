// import 'package:injectable/injectable.dart';
// import 'package:url_launcher/url_launcher.dart';

// abstract class BaseMapService {
//   Future<void> openMap(double lat, double lng);
// }

// @LazySingleton(as: BaseMapService)
// class MapService implements BaseMapService {
//   @override
//   Future<void> openMap(double lat, double lng) async {
//     final String googleMapsUrl =
//         'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
//     final Uri uri = Uri.parse(googleMapsUrl);

//     try {
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       } else {
//         throw 'تعذر فتح خرائط جوجل';
//       }
//     } catch (e) {
//       print("Map Error: $e");
//     }
//   }
// }
// //! change error