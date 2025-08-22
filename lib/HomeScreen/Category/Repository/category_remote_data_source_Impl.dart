import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/AllCategorySourceResponse.dart';

import '../domain/repository/category_remote_data_source.dart';

class  CategoryRemoteDataSourceImpl implements  CategoryRemoteDataSource{
  ApiManger apiManger;
  CategoryRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<AllCategorySourceResponse?> getAllCategory()async {
   var response=await apiManger.getCategory();
return response;
  }
}
CategoryRemoteDataSource injectCategoryRemoteDataSource(){
 return CategoryRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());
}