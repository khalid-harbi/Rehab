import 'package:rehab/core/exports/app_exports.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchInitialState());

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
}
