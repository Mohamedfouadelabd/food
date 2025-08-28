import 'package:food_app/Firebase/Model/My_Meal.dart';

abstract class AddState {}

class AddInitialState extends AddState {}

class AddLoadingState extends AddState {}

class AddErrorState extends AddState {
  final String errorMassage;
  AddErrorState({required this.errorMassage});
}

class AddSucssesState extends AddState {
  final List<MyMeal> meals;
  AddSucssesState({required this.meals});
}
