import '../../../model/FoodCategoryDetilsSourceResponse.dart';

abstract class DetilsFoodState {}

 class DetilsFoodLoadingState extends DetilsFoodState {}

 class DetilsFoodErrorState extends DetilsFoodState {
  String? errorMassage;
  DetilsFoodErrorState({required this.errorMassage});
}

 class DetilsFoodSucssesState extends DetilsFoodState {
  FoodCategoryDetilsSourceResponse? response;
  DetilsFoodSucssesState({required this.response});
}
