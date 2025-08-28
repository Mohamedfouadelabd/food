import 'package:food_app/Api/api_manger.dart';
import 'package:food_app/model/RandomSourceResponse.dart';

import '../domain/repository/random_remote_data_source.dart';

class RandomRemoteDataSourceImpl implements RandomRemoteDataSource{
ApiManger apiManger;
RandomRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<RandomSourceResponse?> getAllRandomCategory()async {
  var response=await apiManger.getAllRandomCategory();
return response;
  }
}

RandomRemoteDataSource injectRandomRemoteDataSource(){
  return RandomRemoteDataSourceImpl(apiManger: ApiManger.getApiInstance());
}