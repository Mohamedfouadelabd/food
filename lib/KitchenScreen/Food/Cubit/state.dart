import '../../../model/CountryMealSourceResponse.dart';


abstract class FoodState{}
class FoodLoadingState extends  FoodState{}
class FoodErrorState  extends  FoodState{
  String ?errorMassage;
  FoodErrorState({required this.errorMassage});
}
class FoodSucssesState extends  FoodState{
  CountryMealSourceResponse ?response;
  FoodSucssesState({required this.response});
}