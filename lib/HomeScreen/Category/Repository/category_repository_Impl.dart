import 'package:food_app/HomeScreen/Category/Repository/category_remote_data_source_Impl.dart';
import 'package:food_app/model/AllCategorySourceResponse.dart';

import '../domain/repository/category_remote_data_source.dart';
import '../domain/repository/category_repository_contract.dart';

class CategoryRepositoryImpl implements CategoryRepositoryContract{
  CategoryRemoteDataSource remoteDataSource;
  CategoryRepositoryImpl({required this.remoteDataSource});
  @override
  Future<AllCategorySourceResponse?> getAllCategory() {
    return remoteDataSource.getAllCategory();
  }

}
CategoryRepositoryContract injectCategoryRepositoryContract(){
  return CategoryRepositoryImpl(remoteDataSource: injectCategoryRemoteDataSource());

}