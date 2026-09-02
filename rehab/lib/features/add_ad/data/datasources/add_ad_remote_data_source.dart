import 'dart:io';

import 'package:injectable/injectable.dart';
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

  /// تعديل إعلان قائم.
  ///
  /// `keptImageUrls` هي الصور القديمة التي أبقتها المالكة، و`newImages` صور
  /// جديدة تُرفع وتُضاف إليها. فلا تُفقد صور الإعلان عند أي تعديل نصّي.
  Future<void> updateHome({
    required int id,
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
    required List<String> keptImageUrls,
    required List<File> newImages,
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

      // 3. Build the row
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

        // كان الإدخال يملأ أعمدة لغة واحدة فقط — تُختار بكشف لغة العنوان
        // وحده — فيبقى الجانب الآخر فارغًا: الإعلان المضاف بالعربية يظهر
        // فراغًا في الواجهة الإنجليزية، ولا تظهر مرافقه ولا سياساته أصلًا.
        //
        // لا توجد طبقة ترجمة في التطبيق، فالنص المُدخل يُكتب في العمودين
        // معًا. العرض يظل يفضّل لغة الواجهة عبر `titleForLocale`، لكن لا
        // يبقى جانب فارغ أبدًا. حين تُضاف ترجمة لاحقًا يكفي تحديث العمود
        // المقابل بلا تغيير في الشاشات.
        'title_ar': title,
        'title_en': title,
        'city_ar': city,
        'city_en': city,
        'district_ar': district,
        'district_en': district,
        'property_type_ar': propertyType,
        'property_type_en': propertyType,
        'description_ar': description,
        'description_en': description,
        'policy_ar': policies,
        'policy_en': policies,
        'amenities_ar': amenities,
        'amenities_en': amenities,
      };

      // 4. Insert into the database
      await _supabase.from('home').insert(insertData);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateHome({
    required int id,
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
    required List<String> keptImageUrls,
    required List<File> newImages,
  }) async {
    try {
      final userId = _supabase.auth.currentUser?.id;

      if (userId == null) {
        throw Exception('User is not authenticated');
      }

      final imageUrls = List<String>.from(keptImageUrls);

      for (final image in newImages) {
        final fileName =
            '${DateTime.now().millisecondsSinceEpoch}_${image.path.split('/').last}';

        await _supabase.storage.from('home-images').upload(fileName, image);

        imageUrls.add(
          _supabase.storage.from('home-images').getPublicUrl(fileName),
        );
      }

      await _supabase
          .from('home')
          .update({
            'rooms': rooms,
            'bathrooms': bathrooms,
            'price': price,
            'area': area.toInt(),
            'lat': lat,
            'lng': lng,
            'image_urls': imageUrls,
            if (imageUrls.isNotEmpty) 'image_url': imageUrls.first,

            // النص يُكتب في عمودَي اللغتين كما في الإضافة تمامًا.
            'title_ar': title,
            'title_en': title,
            'city_ar': city,
            'city_en': city,
            'district_ar': district,
            'district_en': district,
            'property_type_ar': propertyType,
            'property_type_en': propertyType,
            'description_ar': description,
            'description_en': description,
            'policy_ar': policies,
            'policy_en': policies,
            'amenities_ar': amenities,
            'amenities_en': amenities,
          })
          // شرط المالك ضروري: بدونه يستطيع أي مستخدم تعديل عقار غيره.
          .eq('id', id)
          .eq('owner_id', userId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
