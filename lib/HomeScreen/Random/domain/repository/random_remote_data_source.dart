import '../../../../model/RandomSourceResponse.dart';

abstract class RandomRemoteDataSource{

  Future<RandomSourceResponse?>getAllRandomCategory();

}