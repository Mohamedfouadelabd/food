import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FoodScreen/Listfood/Cubit/State.dart';

import '../domin/use_case.dart';

class ListFoodViewModel extends Cubit<ListFoodState> {
  final ListFoodUseCase useCase;

  ListFoodViewModel(this.useCase) : super(ListFoodLoadingState());

  void getFoodCategory() async {
    try {
      emit(ListFoodLoadingState());
      var response = await useCase.invoke();
      if (response?.meals == null) {
        emit(ListFoodErrorState(errorMassage: "No categories found"));
      } else {
        emit(ListFoodSuccessState(response: response));
      }
    } catch (e) {
      emit(ListFoodErrorState(errorMassage: e.toString()));
    }
  }
}
