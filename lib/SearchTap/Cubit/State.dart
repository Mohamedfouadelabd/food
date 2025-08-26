import 'package:food_app/model/SearchSourceResponse.dart';

abstract class SearchState{}
class SearchLoadingState extends SearchState {}
class SearchErrorState extends SearchState {
  String? errorMassage;
  SearchErrorState({required this.errorMassage});
}
class SearchSucssesState extends SearchState {
  SearchSourceResponse? response;
  SearchSucssesState({required this.response});

}