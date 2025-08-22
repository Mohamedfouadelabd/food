import 'package:food_app/HomeScreen/Random/Repository/random_remote_data_source_Impl.dart';
import 'package:food_app/model/RandomSourceResponse.dart';

import '../domain/repository/random_remote_data_source.dart';
import '../domain/repository/random_repository_contract.dart';

class RandomRepositoryImpl implements RandomRepositoryContract{
  RandomRemoteDataSource remoteDataSource;
  RandomRepositoryImpl({required this.remoteDataSource});
  @override
  Future<RandomSourceResponse?> getAllRandomCategory() {
  return remoteDataSource.getAllRandomCategory();
  }
}
RandomRepositoryContract injectRandomRepositoryContract(){
 return RandomRepositoryImpl(remoteDataSource: injectRandomRemoteDataSource());

}