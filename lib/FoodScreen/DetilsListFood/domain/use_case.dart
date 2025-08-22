import 'package:food_app/FoodScreen/DetilsListFood/Repositpry/detils_food_repository_impl.dart';
import 'package:food_app/FoodScreen/DetilsListFood/domain/repository/detils_food_repository_contract.dart';

import '../../../model/FoodCategoryDetilsSourceResponse.dart';

class DetilsFoodUseCase{
  DetilsFoodRepositoryContract repositoryContract;
  DetilsFoodUseCase({required this.repositoryContract});

Future < FoodCategoryDetilsSourceResponse?>invoke(String ingredient){

 return repositoryContract.getFoodByCategory(ingredient);

}

}

DetilsFoodUseCase injectDetilsFoodUseCase(){

  return DetilsFoodUseCase(repositoryContract: injectDetilsFoodRepositoryContract());
}