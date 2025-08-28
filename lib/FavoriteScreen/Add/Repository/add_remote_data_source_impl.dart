import '../../../../Firebase/Model/My_Meal.dart';
import '../../../../Firebase/fire_base_utils.dart';
import '../domain/repository/add_remote_data_source.dart';

class AddRemoteDataSourceImpl implements AddRemoteDataSource {
  final FireBseUtils fireBseUtils;
  AddRemoteDataSourceImpl({required this.fireBseUtils});

  @override
  Future<void> addMeals(MyMeal myMeal) async {
    return fireBseUtils.addMeals(myMeal);
  }

  @override
  Stream<List<MyMeal>> listenToMeals() {
    return fireBseUtils.listenToMeals();
  }

  @override
  Future<void> deleteMeal(String id) async {
    return fireBseUtils.deleteMeal(id);
  }
}

AddRemoteDataSource injectAddRemoteDataSource() {
  return AddRemoteDataSourceImpl(fireBseUtils: FireBseUtils.getFirebaseInstance());
}
