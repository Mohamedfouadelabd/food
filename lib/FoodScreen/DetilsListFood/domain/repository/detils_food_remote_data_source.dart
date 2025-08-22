import '../../../../model/FoodCategoryDetilsSourceResponse.dart';

abstract class DetilsFoodRemoteDataSource{
  Future<FoodCategoryDetilsSourceResponse?> getFoodByCategory(
      String ingredient);
}