import '../../../../model/RandomSourceResponse.dart';

abstract class RandomRepositoryContract{

  Future<RandomSourceResponse?>getAllRandomCategory();

}