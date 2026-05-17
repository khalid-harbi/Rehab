import 'package:geolocator/geolocator.dart';
import 'package:rehab/core/exports/app_exports.dart';
import 'package:rehab/core/services/location_service.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;
  final BaseLocationService _locationService;
  SearchCubit(this._searchUseCase, this._locationService)
    : super(SearchInitialState());

  Future<void> getSearchMethod({required String title}) async {
    emit(SearchLoadingState());

    final result = await _searchUseCase.search(title: title);

    result.when(
      (success) async {
        emit(SearchSuccessState(homes: success));
      },
      (whenError) {
        emit(SearchErrorState(message: whenError.message));
      },
    );
  }

  Future<void> applyFilter({
    double? minPrice,
    double? maxPrice,
    String? city,
    double? minRating,
    double? maxRating,
    int? rooms,
    int? bathrooms,
  }) async {
    emit(SearchLoadingState());

    final result = await _searchUseCase.filter(
      minPrice: minPrice,
      maxPrice: maxPrice,
      city: city,
      minRating: minRating,
      rooms: rooms,
      bathrooms: bathrooms,
    );

    result.when(
      (success) {
        emit(SearchSuccessState(homes: success));
      },
      (error) {
        emit(SearchErrorState(message: error.message));
      },
    );
  }

  Future<void> getNearbyHomesMethod() async {
    emit(SearchLoadingState());

    bool hasPermission = await _locationService.handleLocationPermission();

    if (!hasPermission) {
      emit(const SearchErrorState(message: "يرجى تفعيل صلاحيات الموقع"));
      return;
    }

    try {
      const LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.high,
      );

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: locationSettings,
      );

      final result = await _searchUseCase.getNearbyHomes(
        position.latitude,
        position.longitude,
      );

      result.when(
        (success) {
          emit(SearchSuccessState(homes: success));
        },
        (error) {
          emit(SearchErrorState(message: error.message));
        },
      );
    } catch (e) {
      emit(const SearchErrorState(message: "حدث خطأ أثناء جلب موقعك الحالي"));
    }
  }
}
