import '../../../../model/FoodCategorySourceResponse.dart';

abstract class ListFoodRepositoryContract{
  Future<FoodCategorySourceResponse?> getFoodCategory();

}