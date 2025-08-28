import '../../../../model/AllCategorySourceResponse.dart';

abstract class  CategoryRemoteDataSource{
 Future<AllCategorySourceResponse?>getAllCategory() ;
}