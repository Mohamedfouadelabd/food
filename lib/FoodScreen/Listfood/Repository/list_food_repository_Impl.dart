import 'package:food_app/FoodScreen/Listfood/Repository/list_food_remote_data_source_imp;.dart';
import 'package:food_app/model/FoodCategorySourceResponse.dart';

import '../domin/repository/List_food_remote_data_source.dart';
import '../domin/repository/list_food_repository_contract.dart';

class ListFoodRepositoryContractImpl implements ListFoodRepositoryContract{
  ListFoodRemoteDataSource remoteDataSource;
  ListFoodRepositoryContractImpl({required this.remoteDataSource});
  @override
  Future<FoodCategorySourceResponse?> getFoodCategory() {
  return remoteDataSource.getFoodCategory();
  }

}
ListFoodRepositoryContract injectListFoodRepositoryContract(){
 return ListFoodRepositoryContractImpl(remoteDataSource: injectListFoodRemoteDataSource());
}