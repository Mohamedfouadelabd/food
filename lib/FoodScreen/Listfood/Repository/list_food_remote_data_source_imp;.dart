import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/FoodCategorySourceResponse.dart';

import '../domin/repository/List_food_remote_data_source.dart';

class ListFoodRemoteDataSourceImpl implements ListFoodRemoteDataSource{
  ApiManger apiManger;
  ListFoodRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<FoodCategorySourceResponse?> getFoodCategory() async{
var response =await apiManger.getFoodCategory();
return response;
  }

}

ListFoodRemoteDataSource injectListFoodRemoteDataSource(){
  return ListFoodRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}