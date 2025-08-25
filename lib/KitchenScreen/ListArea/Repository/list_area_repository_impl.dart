
import 'package:food_app/KitchenScreen/ListArea/Repository/list_area_remote_data_source_impl.dart';
import 'package:food_app/model/CountrySourceResponse.dart';

import '../domain/Repository/list_area_remote_data_source.dart';
import '../domain/Repository/list_area_repository_contract.dart';

class ListAreaRepositoryImpl implements ListAreaRepositoryContract{
  ListAreaRemoteDataSource remoteDataSource;
  ListAreaRepositoryImpl({required this.remoteDataSource});
  @override
  Future<CountrySourceResponse?> getCountry() {
  return remoteDataSource.getCountry();
  }
}
ListAreaRepositoryContract injectListAreaRepositoryContract(){
 return ListAreaRepositoryImpl(remoteDataSource: injectListAreaRemoteDataSource());

}