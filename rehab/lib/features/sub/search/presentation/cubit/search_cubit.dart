import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rehab/features/sub/search/domain/use_cases/search_use_case.dart';
import 'package:rehab/features/sub/search/presentation/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase _searchUseCase;

  SearchCubit(this._searchUseCase) : super(SearchInitialState());

  Future<void> getSearchMethod({required String name}) async {
    emit(SearchLoadingState());

    final result = await _searchUseCase.search(name: name);

    result.when(
      (success) async {
        emit(SearchSuccessState(items: success));
      },
      (whenError) {
        emit(SearchErrorState(message: whenError.message));
      },
    );
  }
}
