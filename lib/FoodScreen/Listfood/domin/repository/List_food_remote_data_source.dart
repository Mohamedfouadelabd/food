import '../../../../model/FoodCategorySourceResponse.dart';

abstract class ListFoodRemoteDataSource{
  Future<FoodCategorySourceResponse?> getFoodCategory();

}