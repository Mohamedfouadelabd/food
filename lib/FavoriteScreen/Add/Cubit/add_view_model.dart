import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/FavoriteScreen/Add/Cubit/state.dart';
import '../../../Firebase/Model/My_Meal.dart';
import '../domain/use_case.dart';

class AddViewModel extends Cubit<AddState> {
  final AddUseCase useCase;

  AddViewModel(this.useCase) : super(AddInitialState()) {
    listenToMeals();
  }

  void listenToMeals() {
    useCase.listenToMeals().listen(
          (meals) {
        emit(AddSucssesState(meals: meals));
      },
      onError: (error) {
        emit(AddErrorState(errorMassage: error.toString()));
      },
    );
  }

  Future<void> addMeal(MyMeal myMeal) async {
    try {
      await useCase.invoke(myMeal);

    } catch (e) {
      emit(AddErrorState(errorMassage: e.toString()));
    }
  }

  Future<void> deleteMeal(String id) async {
    try {
      await useCase.deleteMeal(id);

    } catch (e) {
      emit(AddErrorState(errorMassage: e.toString()));
    }
  }
}
