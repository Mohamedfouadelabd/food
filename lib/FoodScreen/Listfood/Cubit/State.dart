import '../../../model/FoodCategorySourceResponse.dart';

abstract class ListFoodState {}

class ListFoodLoadingState extends ListFoodState {}

class ListFoodErrorState extends ListFoodState {
  String? errorMassage;
  ListFoodErrorState({required this.errorMassage});
}

class ListFoodSuccessState extends ListFoodState {
  FoodCategorySourceResponse? response;
  ListFoodSuccessState({required this.response});
}
