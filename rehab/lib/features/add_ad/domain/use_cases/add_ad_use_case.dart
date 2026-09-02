import 'dart:io';

import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';
import 'package:rehab/features/add_ad/domain/repositories/add_ad_repository_domain.dart';

@lazySingleton
class AddAdUseCase {
  final AddAdRepositoryDomain _repositoryData;

  AddAdUseCase(this._repositoryData);

  // Example
  Future<Result<AddAdEntity, Failure>> getAddAd() async {
    return _repositoryData.getAddAd();
  }

  // ===========================================================
  // ===========================================================

  Future<Result<void, Failure>> call({
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
    return _repositoryData.addHome(
      title: title,
      city: city,
      district: district,
      propertyType: propertyType,
      description: description,
      rooms: rooms,
      bathrooms: bathrooms,
      price: price,
      area: area,
      lat: lat,
      lng: lng,
      policies: policies,
      amenities: amenities,
      images: images,
    );
  }

  Future<Result<void, Failure>> update({
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
    return _repositoryData.updateHome(
      id: id,
      title: title,
      city: city,
      district: district,
      propertyType: propertyType,
      description: description,
      rooms: rooms,
      bathrooms: bathrooms,
      price: price,
      area: area,
      lat: lat,
      lng: lng,
      policies: policies,
      amenities: amenities,
      keptImageUrls: keptImageUrls,
      newImages: newImages,
    );
  }
}
