import 'package:food_app/KitchenScreen/Food/domain/repository/food_repository_contract.dart';
import 'package:food_app/KitchenScreen/Food/reository/food_repository_contract.dart';

import '../../../model/CountryMealSourceResponse.dart';

class FoodUseCase {
  FoodRepositoryContract repositoryContract;
  FoodUseCase({required this.repositoryContract});
  Future<CountryMealSourceResponse?> invoke(String area) {
    return repositoryContract.getFoodByCountry(area);
  }
}


 FoodUseCase injectFoodUseCase(){
return FoodUseCase(repositoryContract: injectFoodRepositoryContract());
}
