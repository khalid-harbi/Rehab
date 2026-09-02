import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';

// Example
abstract class AddAdRepositoryDomain {
  Future<Result<AddAdEntity, Failure>> getAddAd();

  // ==============================================================
  // ==============================================================

  Future<Result<void, Failure>> addHome({
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

  Future<Result<void, Failure>> updateHome({
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
