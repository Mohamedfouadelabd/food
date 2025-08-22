
import 'package:food_app/FoodScreen/DetilsListFood/Repositpry/detils_food_remote_data_source_impl.dart';
import 'package:food_app/model/FoodCategoryDetilsSourceResponse.dart';

import '../domain/repository/detils_food_remote_data_source.dart';
import '../domain/repository/detils_food_repository_contract.dart';

class DetilsFoodRepositoryImpl implements DetilsFoodRepositoryContract{
  DetilsFoodRemoteDataSource remoteDataSource;
  DetilsFoodRepositoryImpl({required this.remoteDataSource});
  @override
  Future<FoodCategoryDetilsSourceResponse?> getFoodByCategory(String ingredient) {
return remoteDataSource.getFoodByCategory(ingredient);
  }
}


DetilsFoodRepositoryContract injectDetilsFoodRepositoryContract(){
  return DetilsFoodRepositoryImpl(remoteDataSource: injectDetilsFoodRemoteDataSource());


}