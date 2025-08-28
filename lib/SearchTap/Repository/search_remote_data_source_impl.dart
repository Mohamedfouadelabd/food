import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/SearchSourceResponse.dart';

import '../domain/repository/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource{
  ApiManger apiManger;
  SearchRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SearchSourceResponse?> getSearch(String mealName) async{
var response=await apiManger.getSearch(mealName);
 return response;
  }


}

SearchRemoteDataSource injectSearchRemoteDataSource(){
  return SearchRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}