import '../../../model/SearchSourceResponse.dart';

abstract class SearchRemoteDataSource{
  Future<SearchSourceResponse?> getSearch(String mealName);
}