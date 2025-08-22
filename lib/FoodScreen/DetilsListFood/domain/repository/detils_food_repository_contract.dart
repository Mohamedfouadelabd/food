import '../../../../model/FoodCategoryDetilsSourceResponse.dart';

abstract class DetilsFoodRepositoryContract{
  Future<FoodCategoryDetilsSourceResponse?> getFoodByCategory(
      String ingredient);

}