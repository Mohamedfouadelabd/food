import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/use_case.dart';
import 'State.dart';

class DetilsFoodViewModel extends Cubit<DetilsFoodState> {
  DetilsFoodUseCase useCase;
  DetilsFoodViewModel(this.useCase) : super(DetilsFoodLoadingState());

  void getDetilsFood(String ingredient) async {
    try {
      emit(DetilsFoodLoadingState());
      var response = await useCase.invoke(ingredient);
      if (response?.meals == null) {
        emit(DetilsFoodErrorState(errorMassage: 'Error'));
      } else {
        emit(DetilsFoodSucssesState(response: response));
      }
    } catch (e) {
      emit(DetilsFoodErrorState(errorMassage: e.toString()));
    }
  }
}
