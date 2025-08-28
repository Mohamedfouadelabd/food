import 'package:food_app/FavoriteScreen/Add/domain/repository/add_repository_contract.dart';
import 'package:food_app/Firebase/Model/My_Meal.dart';
import '../Repository/add_repository_impl.dart';

class AddUseCase {
  final AddRepositoryContract repositoryContract;
  AddUseCase({required this.repositoryContract});

  Future<void> invoke(MyMeal myMeal) {
    return repositoryContract.addMeals(myMeal);
  }

  Stream<List<MyMeal>> listenToMeals() {
    return repositoryContract.listenToMeals();
  }

  Future<void> deleteMeal(String id) {
    return repositoryContract.deleteMeal(id);
  }
}

AddUseCase injectAddUseCase() {
  return AddUseCase(repositoryContract: injectAddRepositoryContract());
}
