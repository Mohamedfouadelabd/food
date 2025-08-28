import '../../../model/AllCategorySourceResponse.dart';

abstract class CategoryState{}
class CategoryLoadingState extends CategoryState {}
class CategoryErrorState  extends CategoryState {
  String errorMassage;
  CategoryErrorState({required this.errorMassage});
}
class CategorySucssesState  extends CategoryState {
  AllCategorySourceResponse ?response;
  CategorySucssesState({required this.response});

}