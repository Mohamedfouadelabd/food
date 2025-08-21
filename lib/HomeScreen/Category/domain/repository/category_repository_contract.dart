import '../../../../model/AllCategorySourceResponse.dart';

abstract class CategoryRepositoryContract{
  Future<AllCategorySourceResponse?>getAllCategory() ;

}