import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/FoodCategoryDetilsSourceResponse.dart';

import '../domain/repository/detils_food_remote_data_source.dart';

class DetilsFoodRemoteDataSourceImpl implements DetilsFoodRemoteDataSource{
 ApiManger apiManger;
 DetilsFoodRemoteDataSourceImpl({required this.apiManger});
 @override
  Future<FoodCategoryDetilsSourceResponse?> getFoodByCategory(String ingredient) async{
 var response= await apiManger.getFoodByCategory(ingredient);
 return response;
 }

}

DetilsFoodRemoteDataSource injectDetilsFoodRemoteDataSource(){

return DetilsFoodRemoteDataSourceImpl( apiManger: ApiManger.getApiInstance());

}