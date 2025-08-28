import 'package:food_app/SearchTap/Repository/search_remote_data_source_impl.dart';
import 'package:food_app/model/SearchSourceResponse.dart';

import '../domain/repository/search_remote_data_source.dart';
import '../domain/repository/search_repository_contrac.dart';

class SearchRepositoryImpl implements SearchRepositoryContract{
  SearchRemoteDataSource remoteDataSource;
  SearchRepositoryImpl({required this.remoteDataSource});
  @override

  Future<SearchSourceResponse?> getSearch(String mealName) {
return remoteDataSource.getSearch(mealName);
  }

}

SearchRepositoryContract injectSearchRepositoryContract(){
 return SearchRepositoryImpl(remoteDataSource: injectSearchRemoteDataSource());
}