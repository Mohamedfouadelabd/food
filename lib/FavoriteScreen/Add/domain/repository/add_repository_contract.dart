import 'package:food_app/Firebase/Model/My_Meal.dart';

abstract class AddRepositoryContract {
  Future<void> addMeals(MyMeal myMeal);
  Stream<List<MyMeal>> listenToMeals();
  Future<void> deleteMeal(String id);
}
