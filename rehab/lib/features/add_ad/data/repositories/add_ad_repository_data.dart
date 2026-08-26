import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:rehab/core/errors/network_exceptions.dart';
import 'package:rehab/core/errors/failure.dart';
import 'package:rehab/features/add_ad/domain/entities/add_ad_entity.dart';

import 'package:rehab/features/add_ad/data/datasources/add_ad_remote_data_source.dart';
import 'package:rehab/features/add_ad/data/models/add_ad_model.dart';
import 'package:rehab/features/add_ad/domain/repositories/add_ad_repository_domain.dart';

@LazySingleton(as: AddAdRepositoryDomain)
class AddAdRepositoryData implements AddAdRepositoryDomain {
  final BaseAddAdRemoteDataSource remoteDataSource;

  AddAdRepositoryData(this.remoteDataSource);

  // Example
  @override
  Future<Result<AddAdEntity, Failure>> getAddAd() async {
    try {
      final response = await remoteDataSource.getAddAd();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  // =============================================================
  // =============================================================

  @override
  Future<Result<void, Failure>> addHome({
    required String title, // Renamed from titleAr
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
      await remoteDataSource.addHome(
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
      return const Success(null);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
