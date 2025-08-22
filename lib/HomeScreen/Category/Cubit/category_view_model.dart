import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_app/HomeScreen/Category/Cubit/State.dart';

import '../domain/use_case.dart';

class CategoryViewModel extends Cubit<CategoryState> {
  CategoryUseCase useCase;
  CategoryViewModel(this.useCase) : super(CategoryLoadingState());

  void getAllCategory() async {
    try {
      emit(CategoryLoadingState());
      var response = await useCase.invoke();
      if (response?.categories == null) {
        emit(CategoryErrorState(errorMassage: 'Error??"'));
      } else {
        emit(CategorySucssesState(response: response));
      }
    } catch (e) {
      emit(CategoryErrorState(errorMassage: e.toString()));
    }
  }
}
