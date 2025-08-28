import 'package:food_app/SearchTap/Repository/search_repository_impl.dart';
import 'package:food_app/SearchTap/domain/repository/search_repository_contrac.dart';

import '../../model/SearchSourceResponse.dart';

class SearchUseCase{
  SearchRepositoryContract repositoryContract;
  SearchUseCase({required this.repositoryContract});


  Future<SearchSourceResponse?>invoke(String mealName){
   return repositoryContract.getSearch(mealName);


  }
}
SearchUseCase injectSearchUseCase(){
 return SearchUseCase(repositoryContract: injectSearchRepositoryContract());

}