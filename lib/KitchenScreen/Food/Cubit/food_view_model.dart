import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/KitchenScreen/Food/Cubit/state.dart';

import '../domain/use_case.dart';

class FoodViewModel extends Cubit<FoodState> {
  FoodUseCase useCase;
  FoodViewModel(this.useCase) : super(FoodLoadingState());
  void getFoodByCountry(String area) async {
    try {
      emit(FoodLoadingState());
      var response = await useCase.invoke(area);
      if (response?.meals == null) {
        emit(FoodErrorState(errorMassage: 'Error'));
      } else {
        emit(FoodSucssesState(response: response));
      }
    } catch (e) {
      emit(FoodErrorState(errorMassage: 'Error'));
    }
  }
}
