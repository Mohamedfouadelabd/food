// add_repository_impl.dart
import 'package:food_app/FavoriteScreen/Add/Repository/add_remote_data_source_impl.dart';
import 'package:food_app/Firebase/Model/My_Meal.dart';
import '../domain/repository/add_remote_data_source.dart';
import '../domain/repository/add_repository_contract.dart';

class AddRepositoryImpl implements AddRepositoryContract {
  final AddRemoteDataSource remoteDataSource;
  AddRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addMeals(MyMeal myMeal) {
    return remoteDataSource.addMeals(myMeal);
  }

  @override
  Stream<List<MyMeal>> listenToMeals() {
    return remoteDataSource.listenToMeals();
  }

  @override
  Future<void> deleteMeal(String id) {
    return remoteDataSource.deleteMeal(id); // Forward delete to remote
  }
}

AddRepositoryContract injectAddRepositoryContract() {
  return AddRepositoryImpl(remoteDataSource: injectAddRemoteDataSource());
}
