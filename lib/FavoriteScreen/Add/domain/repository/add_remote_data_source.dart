import '../../../../Firebase/Model/My_Meal.dart';

abstract class AddRemoteDataSource {
  Future<void> addMeals(MyMeal myMeal);
  Stream<List<MyMeal>> listenToMeals();
  Future<void> deleteMeal(String id);
}
