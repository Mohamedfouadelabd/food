import '../../../model/SearchSourceResponse.dart';

abstract class SearchRepositoryContract{
  Future<SearchSourceResponse?> getSearch(String mealName);
}