import 'package:food_app/KitchenScreen/ListArea/Repository/list_area_repository_impl.dart';

import '../../../model/CountrySourceResponse.dart';
import 'Repository/list_area_repository_contract.dart';

class ListAreaUseCase{
  ListAreaRepositoryContract repositoryContract;
  ListAreaUseCase({required this.repositoryContract});
Future<CountrySourceResponse ?>invoke(){

 return repositoryContract.getCountry();
}

}
ListAreaUseCase injectListAreaUseCase(){
 return ListAreaUseCase(repositoryContract: injectListAreaRepositoryContract());
}