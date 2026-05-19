import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/add_ad/domain/use_cases/add_ad_use_case.dart';
import 'package:rehab/features/add_ad/presentation/cubit/add_ad_state.dart';

class AddAdCubit extends Cubit<AddAdState> {
  final AddAdUseCase _addAdUseCase;

  AddAdCubit(this._addAdUseCase) : super(AddAdInitialState());

  Future<void> submitAd({
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
    emit(AddAdLoadingState());
    
    final result = await _addAdUseCase(
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
    
    result.when(
      (success) {
        emit(AddAdSuccessState());
      },
      (error) {
        // Adjust the error message extraction based on your Failure class implementation
        emit(AddAdErrorState(message: error.message)); 
      },
    );
  }
}