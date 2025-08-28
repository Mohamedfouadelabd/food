import 'package:food_app/KitchenScreen/Food/reository/food_remote_data_source_impl.dart';
import 'package:food_app/model/CountryMealSourceResponse.dart';

import '../domain/repository/fodd_remote_Data_source.dart';
import '../domain/repository/food_repository_contract.dart';

class  FoodRepositoryImpl implements  FoodRepositoryContract{
  FoodRemoteDataSource remoteDataSource ;
  FoodRepositoryImpl ({required this .remoteDataSource});

  @override
  Future<CountryMealSourceResponse?> getFoodByCountry(String area) {
return remoteDataSource.getFoodByCountry(area);
  }

}
FoodRepositoryContract injectFoodRepositoryContract(){
return  FoodRepositoryImpl(remoteDataSource: injectFoodRemoteDataSource());
}