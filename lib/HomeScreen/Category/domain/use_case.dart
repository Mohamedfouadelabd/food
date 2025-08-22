import 'package:food_app/HomeScreen/Category/Repository/category_repository_Impl.dart';
import 'package:food_app/HomeScreen/Category/domain/repository/category_repository_contract.dart';
import 'package:food_app/model/AllCategorySourceResponse.dart';

class CategoryUseCase{
  CategoryRepositoryContract repositoryContract;
  CategoryUseCase({required this.repositoryContract});
Future<AllCategorySourceResponse?>invoke(){
 return repositoryContract.getAllCategory();

}

}
CategoryUseCase injectCategoryUseCase(){
 return CategoryUseCase(repositoryContract: injectCategoryRepositoryContract());

}