import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/SearchTap/Cubit/State.dart';

import '../domain/use_case.dart';

class SearchViewModel extends Cubit<SearchState> {
  SearchUseCase useCase;
  SearchViewModel(this.useCase) : super(SearchLoadingState());

  void getSearch(String mealName) async {
    try {
      emit(SearchLoadingState());
      var response = await useCase.invoke(mealName);
      if (response?.meals == null) {
        emit(SearchErrorState(errorMassage: 'Error'));
      } else {
        emit(SearchSucssesState(response: response));
      }
    } catch (e) {
      emit(SearchErrorState(errorMassage: e.toString()));
    }
  }
}
