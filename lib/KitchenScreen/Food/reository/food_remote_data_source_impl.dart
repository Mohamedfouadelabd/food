import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/CountryMealSourceResponse.dart';

import '../domain/repository/fodd_remote_Data_source.dart';

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource{
 ApiManger apiManger;
 FoodRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<CountryMealSourceResponse?> getFoodByCountry(String area) async{
var response=await apiManger.getFoodByCountry(area);
 return response;
  }
}


FoodRemoteDataSource injectFoodRemoteDataSource(){
return  FoodRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}
