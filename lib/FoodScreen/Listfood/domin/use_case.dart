import 'package:food_app/FoodScreen/Listfood/Repository/list_food_repository_Impl.dart';
import 'package:food_app/FoodScreen/Listfood/domin/repository/list_food_repository_contract.dart';

import '../../../model/FoodCategorySourceResponse.dart';

class ListFoodUseCase{
  ListFoodRepositoryContract repositoryContract;
  ListFoodUseCase({required this.repositoryContract});

Future<FoodCategorySourceResponse?>invoke(){

 return repositoryContract.getFoodCategory();
}
}
ListFoodUseCase injectListFoodUseCase(){
 return ListFoodUseCase(repositoryContract: injectListFoodRepositoryContract());

}