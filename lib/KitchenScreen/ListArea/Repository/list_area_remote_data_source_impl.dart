import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/CountrySourceResponse.dart';

import '../domain/Repository/list_area_remote_data_source.dart';

class ListAreaRemoteDataSourceImpl implements ListAreaRemoteDataSource{
  ApiManger apiManger;
  ListAreaRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<CountrySourceResponse?> getCountry() async{
 var response=await apiManger.getCountry();
 return response;
  }
}

ListAreaRemoteDataSource injectListAreaRemoteDataSource(){
 return ListAreaRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());

}