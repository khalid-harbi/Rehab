import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:rehab/core/utils/is_arabic.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:rehab/features/add_ad/data/models/add_ad_model.dart';
import 'package:rehab/core/errors/network_exceptions.dart';

abstract class BaseAddAdRemoteDataSource {
  Future<AddAdModel> getAddAd();
  Future<void> addHome({
    required String title,
    required String city,
    required String district,
    required String propertyType,
    required String description,
    required int rooms,
    required int bathrooms,
    required double price,
    required double area,
    required double lat,
    required double lng,
    required List<String> policies,
    required List<String> amenities,
    required List<File> images,
  });
}

@LazySingleton(as: BaseAddAdRemoteDataSource)
class AddAdRemoteDataSource implements BaseAddAdRemoteDataSource {
  final SupabaseClient _supabase;

  AddAdRemoteDataSource(this._supabase);

  // ==============================================================
  // ==============================================================

  // Example
  @override
  Future<AddAdModel> getAddAd() async {
    try {
      return AddAdModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  // ==============================================================
  // ==============================================================

  @override
  Future<void> addHome({
    required String title,
    required String city,
    required String district,
    required String propertyType,
    required String description,
    required int rooms,
    required int bathrooms,
    required double price,
    required double area,
    required double lat,
    required double lng,
    required List<String> policies,
    required List<String> amenities,
    required List<File> images,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;
      if (userId == null) {
        throw Exception('User is not authenticated');
      }

      // 1. Detect the language based on the title
      final isAr = isArabic(title);

      // 2. Upload images and get URLs
      List<String> uploadedUrls = [];
      for (var image in images) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

        await _supabase.storage.from('home-images').upload(fileName, image);

        final imageUrl = _supabase.storage
            .from('home-images')
            .getPublicUrl(fileName);
        uploadedUrls.add(imageUrl);
      }

      // 3. Dynamically map the columns based on the detected language
      final insertData = {
        'rooms': rooms,
        'bathrooms': bathrooms,
        'price': price,
        'area': area.toInt(),
        'lat': lat,
        'lng': lng,
        'image_urls': uploadedUrls,
        'image_url':
            'https://png.pngtree.com/png-vector/20190820/ourmid/pngtree-no-image-vector-illustration-isolated-png-image_1694547.jpg',
        'owner_id': userId,
        'is_available': true,

        // Dynamic Language Columns
        isAr ? 'title_ar' : 'title_en': title,
        isAr ? 'city_ar' : 'city_en': city,
        isAr ? 'district_ar' : 'district_en': district,
        isAr ? 'property_type_ar' : 'property_type_en': propertyType,
        isAr ? 'description_ar' : 'description_en': description,
        isAr ? 'policy_ar' : 'policy_en': policies,
        isAr ? 'amenities_ar' : 'amenities_en': amenities,
      };

      // 4. Insert into the database
      await _supabase.from('home').insert(insertData);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
