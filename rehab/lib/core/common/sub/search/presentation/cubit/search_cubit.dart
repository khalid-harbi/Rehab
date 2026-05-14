import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/core/common/sub/search/domain/use_cases/search_use_case.dart';
import 'package:rehab/core/common/sub/search/presentation/cubit/search_state.dart';

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
}
